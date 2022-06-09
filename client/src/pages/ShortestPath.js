import React from 'react';
import '../style/ShortestPath.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Form from 'react-bootstrap/Form';
import FormControl from 'react-bootstrap/FormControl';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
// import Jumbotron from 'react-bootstrap/Button';
// import Container from 'react-bootstrap/Button';
import { API_URL } from './Utilities';
import NeoVis from 'neovis.js'

export default class ShortestPath extends React.Component {
  constructor(props) {
    super(props);

    // The state maintained by this React Component.
    this.state = {
        startPeopleFound: [],
        endPeopleFound: [],
        startPersonId: '',
        startPersonName: '',
        endPersonId: '',
        endPersonName: ''
    }
  }

  // React function that is called when the page load.
  componentDidMount() {
    this.draw()
  }

  selectStartPerson = (crewId, name) => {
      this.setState({
        startPersonId: crewId,
        startPersonName: name,
        startPeopleFound: []
      })
  }
  selectEndPerson = (crewId, name) => {
    this.setState({
      endPersonId: crewId,
      endPersonName: name,
      endPeopleFound: []
    })
  }
  resetStartPersonState =  () => {
    this.setState({
        startPersonId: '',
        startPersonName: '',
        startPeopleFound: []
    })
  }
  resetEndPersonState =  () => {
    this.setState({
        endPersonId: '',
        endPersonName: '',
        endPeopleFound: []
    })
  }
  handleStartPersonSearchTextChange = (event) => {
    if (this.state.startPersonName !== '') {
         this.resetStartPersonState()
    }
    fetch(API_URL + '/searchperson?person=' + event.target.value)
    .then(res => res.json())
    .then(results => {
      console.log(results)
      let peopleFound = results.map((crew, i) =>
        <tr key={i}>
          <td>
            <Button variant="light" onClick={() => this.selectStartPerson(crew.id, crew.name)}>{crew.name}</Button>
            </td>
        </tr>
      );
      this.setState({
        startPeopleFound: peopleFound,
      })
    })
  }

  handleEndPersonSearchTextChange =  event => {
    if (this.state.endPersonName !== '') {
        this.resetEndPersonState()
    }
    fetch(API_URL + '/searchperson?person=' + event.target.value)
    .then(res => res.json())
    .then(results => {
      console.log(results)
      let peopleFound = results.map((crew, i) =>
        <tr key={i}>
          <td>
            <Button variant="light" onClick={() => this.selectEndPerson(crew.id, crew.name)}>{crew.name}</Button>
            </td>
        </tr>
      );
      this.setState({
        endPeopleFound: peopleFound,
      })
    })
  }

  handleSearchClick = () => {
      console.log("startPersonId: ", this.state.startPersonId)
      console.log("endPersonId: ", this.state.endPersonId)
      if (this.state.startPersonId !=='' && !!this.state.endPersonId !=='') {
        this.draw(this.state.startPersonId, this.state.endPersonId)
      }
  }

  draw = (start, end) => {
    var config = {
      container_id: "viz",
      server_url: "bolt://ec2-52-207-251-29.compute-1.amazonaws.com:7687",
      server_user: "neo4j",
      server_password: "**REMOVED**",
      arrows: false,
      labels: {
          "Person": {
              "caption": "name",
              "size": 2,
              "community": "name",
              "title_properties": [
                  "name",
                  "id"
              ]
          },
          "Song": {
            "caption": "title",
            "size": 2,
            "community": "songs",
            "title_properties": [
              "title",
              "song_id"
          ]
          }
      },
      relationships: {
          "CREW_IN": {
              "thickness": 1,
              "caption": false,
              "community": "crew"
          },
          "HAS_CREW": {
            "thickness": 1,
            "caption": false,
            "community": "crew"
          },
          "SINGS": {
            "thickness": 1,
            "caption": false,
            "community": "sings"
          },
          "SANG_BY": {
              "thickness": 1,
              "caption": false,
              "community": "sings"
            }
      },
      initial_cypher: `MATCH p = shortestPath((artist1:Person)-[*]-(artist2:Person)) \
      WHERE artist1.id = '${end}' AND artist2.id = '${start}'  \
      RETURN p`
  };
    let viz = new NeoVis(config);
    viz.render();
  }


  render() {
    return (
      <div className="mainContainer">
        <PageNavbar active="shortest-path" />
        <div style={{backgroundColor:'', padding:'32px', margin:'32px',paddingBottom:'0px', marginBottom:'0px', width:'40%'}}>
            <h1>Find the Shortest Path Between Two People!</h1>
            <p>
            Enter two people and we will find the shortest path between them. This
            will help any person find the fastest way to get introduced to someone of interest!
            </p>
        </div>
        <div className="shorestPathMainContainer" >
            <div className="leftSearchBarContainerSP" >
                <div className="searchBarContainer" style={{width:'100%', backgroundColor:''}}>
                    <Form>
                        <FormControl
                            type="text"
                            value = {this.state.startPersonName === '' ? undefined: this.state.startPersonName}
                            placeholder="Start Person"
                            className="mr-sm-2"
                            onChange={this.handleStartPersonSearchTextChange}
                            style={{width:'100%'}}
                        />
                    </Form>
                    <Table hover style={{backgroundColor:'white', width: '95%'}}>
                        <thead>
                        <tr>
                        </tr>
                        </thead>
                        <tbody>
                            {this.state.startPeopleFound}
                        </tbody>
                    </Table>
                </div>
            </div>
            <div className="rightSearchBarContainerSP" >
                <div className="searchBarContainer" style={{width:'100%', backgroundColor:''}}>
                    <Form>
                        <FormControl
                        type="text"
                        value = {this.state.endPersonName === '' ? undefined: this.state.endPersonName}
                        placeholder="End Person"
                        className="mr-sm-2"
                        onChange={this.handleEndPersonSearchTextChange}
                        style={{width:'100%'}}
                        />
                    </Form>
                    <Table hover style={{backgroundColor:'white', width: '95%'}}>
                        <thead>
                        <tr>
                        </tr>
                        </thead>
                        <tbody>
                            {this.state.endPeopleFound}
                        </tbody>
                    </Table>
                </div>
            </div>
            <div style={{padding:'24px'}}>
                <Button variant="primary" onClick={this.handleSearchClick}>Search</Button>
            </div>
            <div style={{width:'100%'}}>
                <div style={{width:'100%', height: '100%'}} id="viz"></div>
            </div>
        </div>
      </div>
    );
  }
}