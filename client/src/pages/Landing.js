import React from 'react';
import '../style/Landing.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import PageNavbar from '../components/PageNavbar';
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';
import Image from 'react-bootstrap/Image'
import logo from '../images/cwlogo.png';

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
        <div className="mainContainer">
            <div className="logoContainer"> 
                <img src={logo} alt="logo" height="500"></img>
            </div>
            <div className="cardContainers"> 
            </div>
        </div>
      </div>
    );
  }
}