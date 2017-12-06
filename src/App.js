import React, { Component } from 'react';
import { MentionsInput, Mention } from 'react-mentions';
import parser from './parser';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      ast: {},
      query: '',
      error: '',
    };
  }

  handleChange = (e) => {
    const query = e.target.value;
    let ast = {};
    let error = '';
    try {
      ast = parser.parse(query);
    } catch (ex) {
      error = ex.message + ` line: ${ex.location.start.line} col: ${ex.location.start.column}`;
    }
    this.setState({ ast, query, error });
  }

  render() {
    const { query, error, ast } = this.state;
    const operators = [
      { id: '1', display: '=' },
      { id: '2', display: '!=' },
      { id: '3', display: 'contains' },
      { id: '4', display: 'starts_with' },
      { id: '5', display: 'ends_with' },
    ];

    return (
      <div className="expression-editor">
        <MentionsInput
          className="expression-editor__textarea"
          value={query}
          onChange={this.handleChange}
          markup="#[__display__]"
        >
          <Mention
            type="operators"
            trigger="#"
            data={operators}
          />
        </MentionsInput>
        <div className="expression-editor__error">
          {error}
          <hr />
          {JSON.stringify(ast, null, 2)}
        </div>
      </div>
    );
  }
}

export default App;
