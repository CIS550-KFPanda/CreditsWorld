import React from 'react';
import '../style/SearchSong.css';
import PageNavbar from '../components/PageNavbar';
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/Button';
import FormControl from 'react-bootstrap/FormControl'
import Image from 'react-bootstrap/Image'
import Table from 'react-bootstrap/Table'


export default class SearchSong extends React.Component {
  constructor(props) {
    super(props);

    // The state maintained by this React Component.
    this.state = {
      song_id: '',
      song: {},
      artists: [],
      writers: [],
      producers: []
    }

    // this.showMovies = this.showMovies.bind(this);
  }

  // React function that is called when the page load.
  componentDidMount() {
    const qs = require('qs')
    let song_id = qs.parse(this.props.location.search, { ignoreQueryPrefix: true }).song_id || undefined
    let queryString = 'http://localhost:8080/getrandomsongcrew'
    if (!song_id) {
      console.log("getting random song")
    } else {
      this.setState({ song_id })
      queryString = 'http://localhost:8080/getsongcrew/' + song_id
    }
    fetch(queryString)
      .then(res => res.json())
      .then(result => {
        let song = result.song
        song.label = (song.label || "None").replace(",", ", ")
        song.year = (song.release_date_for_display || "None    ").slice(-4)
        this.setState({ song })

        let mat = result.crew.reduce((acc, crew) => {
          if (crew.type === 'primary')
            acc[0].unshift(crew.name)
          else if (crew.type === 'featured')
            acc[0].push(crew.name)
          else if (crew.type === 'writer')
            acc[1].push(crew.name)
          else if (crew.type === 'producer')
            acc[2].push(crew.name)
          return acc
        }, [[],[],[]])

        mat = mat.map(arr => arr.map((name, i) => <tr key={i+1}>
          <td>{i+1}</td>
          <td>{name}</td>
        </tr>))

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
        <PageNavbar active="search-song" />
        <div className="searchBarContainer"> 
          <Form inline>
            <FormControl type="text" placeholder="Search" className="mr-sm-2" />
            <Button variant="outline-success">Search</Button>
          </Form>
        </div>

        <div className="mainCardContainer"> 
          <div className="leftContainer" style={{backgroundColor: '#E9AFA3'}}> 
              <h4> Publisher </h4> 
              <p> We don't have this info </p> 
              <h4> Label </h4>
              <p> {this.state.song.label} </p>
              <h4> Album </h4>
              <p> {this.state.song.album} </p>
          </div> 
          <div className="rightContainer">
            <div className="topRowContainer"> 
              <div className="topRowLeftContainer"> 
    <h1 style={{fontSize: '4.5rem'}}> {this.state.song.title} </h1>
                <h4 style={{alignSelf:'flex-end', paddingRight: 24, color: '#989898' }}> ({this.state.song.year}) </h4>
              </div>
              <Image src={this.state.song.song_art_image_thumbnail_url} rounded  height="250"/>
            </div>
            <div className="bottomRowContainer"> 
              <h2 style={{padding: 8}}> Collaborations</h2> 
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