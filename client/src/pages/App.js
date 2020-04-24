import React from 'react';
import {
	BrowserRouter as Router,
	Route,
	Switch
} from 'react-router-dom';

import Landing from './Landing'; 
import SearchSong from './SearchSong'; 
import SearchPerson from './SearchPerson'; 
import Leaderboard from './Leaderboard'; 

export default class App extends React.Component {

	render() {
		return (
			<div className="App">
				<Router>
					<Switch>
						<Route
							exact
							path="/"
							render={() => (
								<Landing />
							)}
						/>
						<Route
							exact
							path="/search-song"
							render={() => (
								<SearchSong />
							)}
						/>
						<Route
							path="/search-person"
							render={() => (
								<SearchPerson />
							)}
						/>
						<Route
							path="/leaderboard"
							render={() => (
								<Leaderboard />
							)}
						/>
					</Switch>
				</Router>
			</div>
		);
	}
}