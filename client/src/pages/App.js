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
import ShortestPath from './ShortestPath'; 

export default class App extends React.Component {

	render() {
		return (
			<div className="mainContainer">
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
							component={SearchSong}
						/>
						<Route
							path="/search-person"
							component={SearchPerson}
						/>
						<Route
							path="/leaderboard"
							render={() => (
								<Leaderboard />
							)}
						/>
						<Route
							path="/shortest-path"
							render={() => (
								<ShortestPath />
							)}
						/>
					</Switch>
				</Router>
			</div>
		);
	}
}