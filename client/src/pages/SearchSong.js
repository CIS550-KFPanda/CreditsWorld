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
    }

    // this.showMovies = this.showMovies.bind(this);
  }

  // React function that is called when the page load.
  componentDidMount() {
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
              <p> Universal Music Group </p> 
              <h4> Label </h4>
              <p> Interscope </p>
              <h4> Album </h4>
              <p> California, CA </p>
          </div> 
          <div className="rightContainer">
            <div className="topRowContainer"> 
              <div className="topRowLeftContainer"> 
                <h1 style={{fontSize: '4.5rem'}}> The Days </h1>
                <h4 style={{alignSelf:'flex-end', paddingRight: 24, color: '#989898' }}> (2014) </h4>
              </div>
              <Image src="https://t2.genius.com/unsafe/220x220/https%3A%2F%2Fimages.rapgenius.com%2F88f1c79b41f2a59d70af856c65266ef5.1000x1000x1.jpg" rounded  height="250"/>
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
                      <tr>
                        <td>Mark</td>
                        <td>Otto</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Jacob</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td colSpan="2">Larry the Bird</td>
                      </tr>
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
                      <tr>
                        <td>Mark</td>
                        <td>Otto</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Jacob</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td colSpan="2">Larry the Bird</td>
                      </tr>
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
                      <tr>
                        <td>Mark</td>
                        <td>Otto</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Jacob</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td colSpan="2">Larry the Bird</td>
                      </tr>
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