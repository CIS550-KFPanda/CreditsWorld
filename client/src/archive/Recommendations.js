import React from 'react';
import PageNavbar from '../components/PageNavbar';
import RecommendationsRow from './RecommendationsRow';
import '../style/Recommendations.css';
import 'bootstrap/dist/css/bootstrap.min.css';

export default class Recommendations extends React.Component {
	constructor(props) {
		super(props);

		// State maintained by this React component is the selected movie name,
		// and the list of recommended movies.
		this.state = {
			movieName: "",
			recMovies: []
		}

		this.handleMovieNameChange = this.handleMovieNameChange.bind(this);
		this.submitMovie = this.submitMovie.bind(this);
	}

	handleMovieNameChange(e) {
		this.setState({
			movieName: e.target.value
		});
	}

	/* ---- Q2 (Recommendations) ---- */
	// Hint: Name of movie submitted is contained in `this.state.movieName`.
	submitMovie() {
		let movieName = this.state.movieName; 
		let url = "http://localhost:8081/recommendations/" + movieName; 
		
		fetch(url,
	    {
	      method: 'GET' // The type of HTTP request.
	    }).then(res => {
	      // Convert the response data to a JSON.
	      return res.json();
	    }, err => {
	      // Print the error if there is one.
	      console.log(err);
	    }).then(resultsList => {
	      if (!resultsList) return;
	      // Map each genreObj in genreList to an HTML element:
	      // A button which triggers the showMovies function for each genre.
	      let recMovies = resultsList.map((movieObj, i) =>
	      	<RecommendationsRow 
	      	  title={movieObj.title} 
		      movie_id = {movieObj.id}
	          rating={movieObj.rating} 
	          vote_count={movieObj.vote_count}
	      	/> 
	      );	      

	      // Set the state of the genres list to the value returned by the HTTP response from the server.
	      this.setState({
	        recMovies
	      });
	    }, err => {
	      // Print the error if there is one.
	      console.log(err);
	    });

	}

	
	render() {

		return (
			<div className="Recommendations">
				<PageNavbar active="recommendations" />

			    <div className="container recommendations-container">
			    	<div className="jumbotron">
			    		<div className="h5">Recommendations</div>
			    		<br></br>
			    		<div className="input-container">
			    			<input type='text' placeholder="Enter Movie Name" value={this.state.movieName} onChange={this.handleMovieNameChange} id="movieName" className="movie-input"/>
			    			<button id="submitMovieBtn" className="submit-btn" onClick={this.submitMovie}>Submit</button>
			    		</div>
			    		<div className="header-container">
			    			<div className="h6">You may like ...</div>
			    			<div className="headers">
			    				<div className="header"><strong>Title</strong></div>
			    				<div className="header"><strong>Movie ID</strong></div>
					            <div className="header"><strong>Rating</strong></div>
					            <div className="header"><strong>Vote Count</strong></div>
			    			</div>
			    		</div>
			    		<div className="results-container" id="results">
			    			{this.state.recMovies}
			    		</div>
			    	</div>
			    </div>
		    </div>
		);
	}
}