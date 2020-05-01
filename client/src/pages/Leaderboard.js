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
    }

    // this.showMovies = this.showMovies.bind(this);
  }

  // React function that is called when the page load.
  componentDidMount() {

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
                  <th>Username</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td><a href= "/search-person" >
                    <Image src = "https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg"  height="50" roundedCircle/> Justin Bibebr
                    </a></td>
                  <td><a href= "/search-song" >
                      What do you mean
                    </a></td>
                  <td>@justinBieber</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td><a href= "/search-person" >
                    <Image src = "https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg"  height="50" roundedCircle/> Justin Bibebr
                    </a></td>
                  <td><a href= "/search-song" >
                      What do you mean
                    </a></td>
                  <td>@justinBieber</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td><a href= "/search-person" >
                    <Image src = "https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg"  height="50" roundedCircle/> Justin Bibebr
                    </a></td>
                  <td><a href= "/search-song" >
                      What do you mean
                    </a></td>
                  <td>@justinBieber</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td><a href= "/search-person" >
                    <Image src = "https://images.genius.com/b8a71aef947716b9e24dcbea07fd23d1.800x800x1.jpg"  height="50" roundedCircle/> Justin Bibebr
                    </a></td>
                  <td><a href= "/search-song" >
                      What do you mean
                    </a></td>
                  <td>@justinBieber</td>
                </tr>
              </tbody>
            </Table>
          </div> 
        </div> 
      </div>
    );
  }
}