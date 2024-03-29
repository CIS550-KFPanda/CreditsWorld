import React from 'react';
import '../style/Landing.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';
import logo from '../images/cwlogo.png';
// import Image from 'react-bootstrap/Image'
// import chartsLogo from '../images/charts.png';

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
      <div className="mainContainer">
        <PageNavbar active="landing" />
          <div className="landingMainContainer" > 
            <div className="logoContainer"> 
                <img src={logo} alt="logo" height="500px"></img>
            </div>
            <div className="cardContainers"> 
              <Card bg={'info'} className="text-center" style={{ width: '18rem', justifyContent:'space-around', height:'300px'}}>
                  <h2 style={{ paddingTop: '18px'}}>Search Song</h2>
                    <p style={{ marginRight:'18px', marginLeft:'18px'}}>
                      Find the crew that made your favorite song a reality here 
                    </p>
                  <div style={{ paddingBottom:'18px'}}> 
                    <Button variant="light" href = "/search-song" style={{ width: '50%'}}>Find Song</Button>
                  </div>
              </Card>
              <Card bg={'danger'} className="text-center" style={{ width: '18rem', justifyContent:'space-around', height:'300px'}}>  
                <h2 style={{ paddingTop: '18px'}}>Search Person</h2>
                <p style={{ marginRight:'18px', marginLeft:'18px'}}>
                Look up your favorite singer, songwriter or producer and we'll show you who they have worked with in the past and all the songs they helped create.
                </p>
                <div style={{ paddingBottom:'18px'}}> 
                  <Button variant="light" href = "/search-person" style={{ width: '50%'}}>Find Artist</Button>
                </div>
              </Card>
              <Card bg={'warning'} className="text-center" style={{ width: '18rem',justifyContent:'space-around', height:'300px' }}>
                <h2 style={{ paddingTop: '18px'}}>Leaderboard</h2>
                <p style={{ marginRight:'18px', marginLeft:'18px'}}>
                See what artists and song are topping the charts 
                </p>
                <div style={{ paddingBottom:'18px'}}> 
                  <Button variant="light" href = "/leaderboard" style={{ width: '50%'}}>Leaderboard</Button>
                </div>
              </Card>
            </div>
          </div>
      </div>
    );
  }
}