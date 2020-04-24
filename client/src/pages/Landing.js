import React from 'react';
import '../style/Landing.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';
import Image from 'react-bootstrap/Image'
import logo from '../images/cwlogo.png';
import chartsLogo from '../images/charts.png';

export default class Landing extends React.Component {
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
      <div>
        <PageNavbar active="landing" />

            <div className="logoContainer"> 
                <img src={logo} alt="logo" height="500"></img>
            </div>
            <div className="cardContainers"> 
            <Card style={{ width: '18rem' }}>
              
              <Card.Body>
                <Card.Title>Search Song</Card.Title>
                <Card.Text>
                  Find the crew that made your favorite song a reality here 
                </Card.Text>
                <Button variant="primary" href = "/search-song">Find your song</Button>
              </Card.Body>
            </Card>
        <Card style={{ width: '18rem' }}>
         
          <Card.Body>
            <Card.Title>Search Person</Card.Title>
            <Card.Text>
              Look up your favorite singer, songwriter or producer and we'll show you who they have worked with in the past and all the songs they helped create.
            </Card.Text>
            <Button variant="primary" href = "/search-person" >Look up an artist</Button>
          </Card.Body>
          </Card>
      <Card style={{ width: '18rem' }}>
        
          <Card.Body>
            <Card.Title>Leaderboard</Card.Title>
            <Card.Text>
              See what artists and song are topping the charts 
            </Card.Text>
            <Button variant="primary" href = "/leaderboard"> See the what's trending</Button>
          </Card.Body>
          </Card>

            </div>
      </div>
    );
  }
}