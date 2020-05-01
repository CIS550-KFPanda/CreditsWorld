import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

export default class PageNavbar extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			navDivs: []
		}
	}

	formatString(s) {
		//See if it is a multiworded string be splitting on '-'
		var seperatedWords = s.split("-"); 
		for(var i =0; i < seperatedWords.length; i++) {
			//Capitalize the first letter of every word
			seperatedWords[i] = seperatedWords[i].charAt(0).toUpperCase() + seperatedWords[i].substring(1, seperatedWords[i].length)
		}
		return seperatedWords.join(' '); 
	}

	componentDidMount() {
		const pageList = ['search-song', 'search-person', 'leaderboard'];
		console.log(this.props.active)
		let navbarDivs = pageList.map((page, i) => {
			if (this.props.active === page) {
				return <a className="nav-item nav-link active" key={i} href={"/" + page}>{this.formatString(page)}</a>
			}
			else {
				return <a className="nav-item nav-link" key={i} href={"/" + page}>{this.formatString(page)}</a>
			}
		})

		this.setState({
			navDivs: navbarDivs
		});
	}

	render() {
		return (
			<div className="PageNavbar">
				<nav className="navbar navbar-expand-lg navbar-light bg-light">
			      <a className="navbar-brand center" href={"/"}>Credits World</a>
			      <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
			        <div className="navbar-nav">
			        {this.state.navDivs}
			        </div>
			      </div>
			    </nav>
			</div>
        );
	}
}