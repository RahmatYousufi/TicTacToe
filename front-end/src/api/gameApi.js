export const getGameState = () => {
    return fetch('http://localhost:4000/api/squares');
}

export const putGameState = async (squares) => {
    const response = await fetch('http://localhost:4000/api/squares/1', {
        method: 'PUT',
        headers: {
          'Content-type': 'application/json'
        },
        body: JSON.stringify(
          {square: {
          square_zero: squares[0],
          square_one: squares[1],
          square_two: squares[2],
          square_three: squares[3],
          square_four: squares[4],
          square_five: squares[5],
          square_six: squares[6],
          square_seven: squares[7],
          square_eight: squares[8]
        }})
      });

      return response.json();
}

export const getScores = () => {
  return fetch('http://localhost:4000/api/scores');
}

export const putScores = async (scores) => {
  const response = await fetch('http://localhost:4000/api/scores/1', {
      method: 'PUT',
      headers: {
        'Content-type': 'application/json'
      },
      body: JSON.stringify(
        {score: {
          X: scores.X,
          O: scores.O
      }})
    });

    return response.json();
}