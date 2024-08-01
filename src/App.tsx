import React from "react";

const App: React.FC = () => {
  const AppName = process.env.REACT_APP_REPO_NAME;
  const BaseUrl = process.env.REACT_APP_BASE_URL;

  return (
    <div>
      <h1>
        PROJECT NAME IS {AppName} and base url: {BaseUrl}
      </h1>
    </div>
  );
};

export default App;
