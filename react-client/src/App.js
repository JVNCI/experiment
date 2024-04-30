import React, { useState, useEffect } from "react";

function App() {
  const [items, setItems] = useState([]);

  useEffect(() => {
    fetch("http://localhost:3000/items")
      .then((response) => response.json())
      .then((data) => setItems(data))
      .catch((error) => console.error("Error fetching data:", error));
  }, []);
  return (
    <div>
      <h1>Exp React Client</h1>
      <ul>
        {items.map((item) => {
          <li key={item.id}>
            {item.name}: {item.description}
          </li>;
        })}
      </ul>
    </div>
  );
}

export default App;
