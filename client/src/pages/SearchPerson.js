import React from 'react';
import '../style/SearchSong.css';
import PageNavbar from '../components/PageNavbar';
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button';
import FormControl from 'react-bootstrap/FormControl'
import Image from 'react-bootstrap/Image'
import Table from 'react-bootstrap/Table'
import { API_URL } from './Utilities';


export default class SearchPerson extends React.Component {
  constructor(props) {
    super(props);

    // The state maintained by this React Component.
    this.state = {
      artist_id: '',
      artist: {},
      artists: [],
      writers: [],
      producers: []
    }

    // this.showMovies = this.showMovies.bind(this);
  }

  // React function that is called when the page load.
  componentDidMount() {
    const qs = require('qs')
    let artist_id = qs.parse(this.props.location.search, { ignoreQueryPrefix: true }).artist_id || undefined
    let queryString = API_URL + '/getrandomcollaborators'
    if (!artist_id) {
      console.log("getting random artist")
    } else {
      this.setState({ artist_id })
      queryString = API_URL + '/getcollaborators/' + artist_id;
    }
    fetch(queryString)
      .then(res => res.json())
      .then(result => {
        console.log('HERE', result.person)
        let artist = result.person;
        artist.user = "@" + artist.name.replace(" ", "")
        this.setState({ artist })
        let i = 0;
        let mat = result.collaborators.reduce((acc, crew) => {
          let jsx = <tr key={i++}>
            <td><a href={crew.url}>{crew.name}</a></td>
            <td>{crew.song_title}</td>
          </tr>
          if (crew.type === 'primary')
            acc[0].unshift(jsx)
          else if (crew.type === 'featured')
            acc[0].push(jsx)
          else if (crew.type === 'writer')
            acc[1].push(jsx)
          else if (crew.type === 'producer')
            acc[2].push(jsx)
          return acc
        }, [[],[],[]])

        this.setState({
          artists: mat[0],
          writers: mat[1],
          producers: mat[2]
        })
      })      
    
  }

  render() {    
    return (
      <div className="mainContainer">
        <PageNavbar active="search-person" />
        <div className="searchBarContainer"> 
          <Form inline>
            <FormControl type="text" placeholder="Search" className="mr-sm-2" />
            <Button variant="outline-success">Search</Button>
          </Form>
        </div>

        <div className="mainCardContainer"> 
          <div className="leftContainer" style={{backgroundColor: 'rgba(196, 129, 62, 0.63)'}}> 
              <h4> Publisher </h4> 
              <p> Universal Music Group </p> 
              <h4> Label </h4>
              <p> Interscope </p>
              <h4> Location </h4>
              <p> California, CA </p>
          </div> 
          <div className="rightContainer">
            <div className="topRowContainer"> 
              <div className="topRowLeftContainer"> 
                <h1 style={{fontSize: '4.5rem'}}> {this.state.artist.name} </h1>
    <h6 style={{alignSelf:'flex-end', paddingRight: 24}}> <a href={this.state.artist.url}> {this.state.artist.user} </a> </h6>
              </div>
              <Image src={this.state.artist.image_url} roundedCircle  height="250"/>
            </div>
            <div className="bottomRowContainer"> 
              <h2 style={{padding: 8}}> Collaborators</h2> 
              <div className="tablesContainer">
                {/* Artists  */}
                <div className="singleTableContainer">
                  <h3> Aritsts </h3>
                  <Table  hover>
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Song</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.artists}
                    </tbody>
                  </Table>
                </div>
                {/* Songwriters  */}
                <div className="singleTableContainer">
                  <h3> Songwriters </h3>
                  <Table hover>
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Song</th>
                      </tr>
                    </thead>
                    <tbody>
                     {this.state.writers}
                    </tbody>
                  </Table>
                </div>

                {/* Producers  */}
                <div className="singleTableContainer">
                  <h3> Producers </h3>
                  <Table hover>
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Song</th>
                      </tr>
                    </thead>
                    <tbody>
                      {this.state.producers}
                    </tbody>
                  </Table>
                </div>
              </div>

            </div>
          </div> 
        </div>

      </div>
    );
  }
}