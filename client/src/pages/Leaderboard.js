import React from 'react';
import '../style/Leaderboard.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Table from 'react-bootstrap/Table'
import Image from 'react-bootstrap/Image'
import Dropdown from 'react-bootstrap/Dropdown'



export default class Leaderboard extends React.Component {
  constructor(props) {
    super(props);

    // The state maintained by this React Component.
    this.state = {
      rows: []
    }

    // this.showMovies = this.showMovies.bind(this);
  }

 
  // React function that is called when the page load.
  componentDidMount() {
    fetch('http://localhost:8080/leaderboardartists')
      .then(res => res.json())
      .then(result => {
        let rows = result.map((row, i) => 
          <tr key={'row'+i}>
            <td>{i+1}</td>
            <td><a href= "/search-person" >
              <Image src={row.image_url}  height="50" roundedCircle/> {row.name}
              </a></td>
            <td><a href= "/search-song" >
                {row.top_song_name}
              </a></td>
            <td><a href={row.url}>{row.url}</a></td>
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
            <Dropdown>
              <Dropdown.Toggle variant="primary" id="dropdown-basic">
              Top Artists
              </Dropdown.Toggle>

              <Dropdown.Menu>
                <Dropdown.Item href="#/action-1">Top Artists</Dropdown.Item>
                <Dropdown.Item href="#/action-2">Top Songs</Dropdown.Item>
                <Dropdown.Item href="#/action-3">Top Producers</Dropdown.Item>
                <Dropdown.Item href="#/action-3">Top Songwriters</Dropdown.Item>

              </Dropdown.Menu>
            </Dropdown>
          </div>
          <div className="leaderboardTableContainer">
            <Table bordered hover>
              <thead>
                <tr>
                  <th>Rank</th>
                  <th>Artist Name</th>
                  <th>Top Song</th>
                  <th>Website</th>
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