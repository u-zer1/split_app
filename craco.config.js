const path = require("path");

module.exports = {
  paths: function (paths) {
    const appName = process.env.REACT_APP_REPO_NAME;

    const publicFolder = `public:${appName}`;

    paths.appHtml = path.resolve(__dirname, `${publicFolder}/index.html`);

    paths.appPublic = path.resolve(__dirname, publicFolder);

    return paths;
  },
};
