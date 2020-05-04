import React from 'react';
import '../style/Leaderboard.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Table from 'react-bootstrap/Table'
import Image from 'react-bootstrap/Image'
import Dropdown from 'react-bootstrap/Dropdown'
import { API_URL } from './Utilities';



export default class Leaderboard extends React.Component {
  constructor(props) {
    super(props);

    // The state maintained by this React Component.
    this.state = {
      dropdownToggled: "Top Artists", 
      dropDownItems: ["Top Artists", "Top Songs","Top Producers","Top Songwriters"] , 
      tableHeaders: [], 
      rows: []
    }
  }

 
  // React function that is called when the page load.
  componentDidMount() {
    this.renderTable(this.state.dropdownToggled)
  }
  
  renderTable = (dropdownToggled) => {
    var queryParam = ''; 
    var tableHeaders = []
    if (dropdownToggled === "Top Artists") {
      queryParam = '/leaderboardartists'; 
      tableHeaders = ["#", "Artist Name", "Top Song", "Website"]
      this.renderTopPerson(queryParam)
    } else if (dropdownToggled === "Top Songs") {
      tableHeaders = ["#", "Song Name", "Artist", "Youtube Url"]
      this.renderTopSongs()
    } else if (dropdownToggled === "Top Producers") {
      queryParam= "/leaderboardproducers"
      tableHeaders = ["#", "Producer Name", "Top Song", "Website"]
      this.renderTopPerson(queryParam)
    } else {
      queryParam= "/leaderboardwriters"
      tableHeaders = ["#", "Songwriter Name", "Top Song", "Website"]
      this.renderTopPerson(queryParam)
    }
    this.renderTableHeaders(tableHeaders)
    return {
      "queryParam": queryParam, 
      "tableHeaders": tableHeaders
    }
  }

  handleDropdownSelect = (eventKey) => {
    const newDropdownToggled = this.state.dropDownItems[eventKey]; 
    this.setState({dropdownToggled: newDropdownToggled}); 
    this.renderTable(newDropdownToggled); 
  }

  renderTableHeaders = (headers) => {
    var tableHeaders = headers.map((tableHeader,i) => 
        <th key={i}>{tableHeader}</th>
    )
    this.setState({tableHeaders})
  }

  renderTopPerson= (queryParam) => {
    // const artist_id = ;
    fetch(API_URL + queryParam)
    .then(res => res.json())
    .then(result => {
      let rows = result.map((row, i) => 
        <tr key={'row'+i}>
          <td>{i+1}</td>
          <td><a href= {"/search-person?artist_id="+ (queryParam === '/leaderboardartists' ) ? row.artist_id : row.crew_id} >
            <Image src={row.image_url}  height="50" roundedCircle style={{paddingRight:'8px'}}/> {row.name}
            </a></td>
          <td><a href= {"/search-song?song_id="+row.top_song_id} >
              {row.top_song_name}
            </a></td>
          <td><a href={row.url}>{row.url}</a></td>
        </tr>
      )
      this.setState({ rows })
    }).catch(console.log)
  }

  renderTopSongs = () => {
    fetch(API_URL + '/leaderboardsongs')
    .then(res => res.json())
    .then(result => {
      console.log("Top Songs: ", result)
      let rows = result.map((row, i) => 
        <tr key={'row'+i}>
          <td>{i+1}</td>
          <td><a href= {"/search-song?song_id="+row.song_id} >
            <Image src={row.song_art_image_thumbnail_url}  height="50" rounded style={{paddingRight:'4px'}}/> {row.title}
            </a></td>
          <td><a href= {"/search-song?song_id="+row.artist_id} >
            <Image src={row.image_url}  height="50" roundedCircle style={{paddingRight:'4px'}} />{row.name}
            </a></td>
          <td><a href={row.youtube_url}>{row.youtube_url}</a></td>
        </tr>
      )
      this.setState({ rows })
    }).catch(console.log)
  }

  render() {    
    return (
      <div className="mainContainer">
        <PageNavbar active="leaderboard" />
        
        <div className="leaderboardContainer">
          <div className='titleContainer'> 
          <h1> Leaderboard</h1>
            <Dropdown onSelect={this.handleDropdownSelect}>
              <Dropdown.Toggle variant="primary">
                {this.state.dropdownToggled}
              </Dropdown.Toggle>
              <Dropdown.Menu>
                {this.state.dropDownItems.map((dropDownItem,i) =>
                  <Dropdown.Item key={i} eventKey={i}>{dropDownItem}</Dropdown.Item>
                )}
              </Dropdown.Menu>
            </Dropdown>
          </div>
          <div className="leaderboardTableContainer">
            <Table bordered hover>
              <thead>
                <tr>
                  {this.state.tableHeaders} 
                </tr>
              </thead>
              <tbody>
                {this.state.rows}
              </tbody>
            </Table>
          </div> 
        </div> 
      </div>
    );
  }
}