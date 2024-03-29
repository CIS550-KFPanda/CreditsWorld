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
      peopleFound: [],  
      artist_id: '',
      artist: {},
      artists: [],
      writers: [],
      producers: [], 
      recommendations: [], 
      crewNames: []  
    }

  }
  //filter Recommendations to make sure they don't appear in collaborators 
  filterRecommendations = (recommendations) => {
    return recommendations.filter(recommendation => {
       return !this.state.crewNames.includes(recommendation.rec_name);
    }); 
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
    this.renderPage(queryString)
  }
  //Changes state every time the user enters text into the search bar
  handleSearchTextChange = (event) => {
    fetch(API_URL + '/searchperson?person=' + event.target.value)
      .then(res => res.json())
      .then(results => {
        console.log(results)
        let peopleFound = results.map((crew, i) => 
          <tr key={i}>
            <td><a href={"/search-person?artist_id="+crew.id}>{crew.name}</a></td>
          </tr> 
        ); 
        this.setState({
          peopleFound: peopleFound
        })
      })
  }
  
  findCollaborators = (queryString) => {
    return fetch(queryString)
      .then(res => res.json())
      .then(result => {
        console.log('HERE', result.person)
        let artist = result.person;
        artist.user = "@" + artist.name.replace(" ", "")
        this.setState({ artist })
        let i = 0;
        var crewNames = []; 
        let mat = result.collaborators.reduce((acc, crew) => {
          let jsx = <tr key={i++}>
            <td><a href={"/search-person?artist_id="+crew.id}>{crew.name}</a></td>
            <td><a href={"/search-song?song_id="+crew.song_id}>{crew.song_title}</a></td>
          </tr> 
          //Record crewNames to make sure we don't have duplicates
          crewNames.push(crew.name)

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
          producers: mat[2], 
          crewNames: crewNames
        })
        return artist.id
      }) 
  }
  findRecommendation = (id) => {
    console.log("ID: " , id)
    const queryString = API_URL + '/getrecommendations/' + id;
    fetch(queryString)
    .then(res => res.json())
    .then(results => {
      console.log('Recommendation: ', results)
      let filteredRecommendation = this.filterRecommendations(results); 
      let recommendations = filteredRecommendation.map((result, i) => 
      <tr key={i}>
        <td>{++i}</td>
        <td> 
          <a href= {"/search-person?artist_id="+ result.rec_id} >
              <Image src={result.rec_image}  height="50" roundedCircle style={{paddingRight:'8px'}}/> {result.rec_name}
          </a>
        </td> 
        <td><a href={result.rec_url}>{result.rec_url}</a></td>
      </tr> 
      ); 
      this.setState({
        recommendations: recommendations
      })
    });
  }
  renderPage = async (queryString) => {
    let artist_id = await this.findCollaborators(queryString); //Wait until artist_id is set
    this.findRecommendation(artist_id);
  }
  render() {    
    console.log("People Found: ", this.state.peopleFound)

    return (
      <div className="mainContainer">
        <PageNavbar active="search-person" />
        <div className="bodyCardContainer" > 
          <div className="searchBarContainer"> 
            <Form>
              <FormControl 
                type="text" 
                placeholder="Search Artist, Songwriter, or Producer" 
                className="mr-sm-2"  
                onChange={this.handleSearchTextChange}
                style={{width:'100%'}}
              />
            </Form>
            <Table hover style={{backgroundColor:'white', width: '95%'}}>
              <thead>
                <tr>
                </tr>
              </thead>
              <tbody>
                {this.state.peopleFound}
              </tbody>
            </Table>
          </div>
          <div className="mainCardContainer"> 
            <div className="leftContainer" style={{backgroundColor: 'rgba(196, 129, 62, 0.63)'}}> 
            </div> 
            <div className="rightContainer">
              <div className="topRowContainer"> 
                <div className="topRowLeftContainer"> 
                  <h1 style={{fontSize: '4.5rem'}}> {this.state.artist.name} </h1>
                  <h6 style={{alignSelf:'flex-end', paddingRight: 24}}> <a href={this.state.artist.url}> {this.state.artist.user} </a> </h6>
                </div>
                <Image src={this.state.artist.image_url} roundedCircle  height="250"/>
              </div>
              <div className="bottomRowContainer" style={{backgroundColor:''}}> 
                <h2 style={{padding: 8}}> Collaborators</h2> 
                <div className="tablesContainer">
                  {/* Artists  */}
                  <div className="singleTableContainer">
                    <h3> Artists </h3>
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
              <div className="bottomRowContainer" style={{backgroundColor:''}}> 
                <h2 style={{padding: 8}}> Recommendations</h2>
                <Table hover>
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>Genius URL</th>
                        </tr>
                      </thead>
                      <tbody>
                        {this.state.recommendations}
                      </tbody>
                </Table>
              </div> 
            </div> 
          </div>
          <div className="findRandomContainer"> 
            <div style={{width: '50%'}}> 
              <Button variant="primary" onClick={() => this.renderPage(API_URL + '/getrandomcollaborators')}>Find Random</Button>
            </div> 
          </div>
        </div> 
      </div>
    );
  }
}