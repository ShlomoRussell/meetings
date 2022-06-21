import { useEffect, useRef, useState } from "react";

function App() {
    const [selectValues, setSelectValues] = useState([])
    const [teams, setTeams] = useState(null)
    const [selectedTeam, setSelectedTeam] = useState()
    const [addButtonClicked, setAddButtonClicked] = useState(false);
    const [newMeeting,setNewMeeting]=useState({});
    const selectRef = useRef()
    useEffect(() => {
        fetch('/teams').then(res => res.json()).then(jres => {
            setSelectValues(jres)
        })
    })

    const handleSelect = () => {
        fetch(`/teams/${selectRef.current.value}`)
            .then(res => res.json())
            .then(jres => setTeams(jres))

    }
    
    const onAddNewMeeting = (e) => {
        const selectedMeeting = selectValues.find(sv => sv.team_code == selectRef.current.value);
        setAddButtonClicked(true)
        setSelectedTeam(selectedMeeting.team_name)
        setNewMeeting({...newMeeting,team_code : selectedMeeting.team_code,team_code : selectedMeeting.team_name})
    }

    const handleClick = (e) => {
        e.preventDefault()
        fetch("/teams", {
            method: 'POST',
            headers: {"Content-Type": "application/json" },
            body: JSON.stringify(newMeeting)
        }).then(res => console.log(res.body))
    }
    return (
        <div >
            <select ref={selectRef}>{selectValues.map((sv, i) => <option key={i} value={sv.team_code}>{sv.team_name}</option>)}</select>
            <button onClick={handleSelect}>select</button>
            <button onClick={onAddNewMeeting}>Add New Meeting</button>

            {teams && <table>
                <thead>
                    <tr>
                        <th>Meeting Code</th>
                        <th>Room</th>
                        <th>Start time</th>
                        <th>End time</th>
                        <th>Meeting info</th>
                    </tr>
                </thead>
                {teams.map((t, i) => (<tbody key={i}>
                    <tr >
                        <td >{t.meeting_code}</td>
                        <td >{t.meeting_room}</td>
                        <td >{t.start_time.split('T')[1].split('.')[0]}</td>
                        <td >{t.end_time.split('T')[1].split('.')[0]}</td>
                        <td >{t.about_meeting}</td>
                    </tr>
                </tbody>))}
            </table>}
            {
                addButtonClicked &&
                <form>
                    <label>Team Name  <input type='text' value={selectedTeam} disabled /></label>
                    <label>Start Time <input type='datetime-local' onChange={(e) => setNewMeeting({...newMeeting,start_time : e.target.value})} /></label>
                    <label>End Time  <input type='datetime-local' onChange={(e) => setNewMeeting({...newMeeting,end_time : e.target.value})} /></label>
                    <label>Meeting Room <input type='text' onChange={(e) => setNewMeeting({...newMeeting,meeting_room :e.target.value})} /></label>
                    <label>About Meeting  <input type='text' onChange={(e) => setNewMeeting({...newMeeting,about_meeting : e.target.value})} /></label>
                    <button onClick={handleClick}>Add</button>
                </form>

            }
        </div>
    );
}

export default App;
