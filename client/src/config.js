const config = {
  postsServiceUrl: process.env.REACT_APP_POSTS_SERVICE_URL || '/posts',
  commentsServiceUrl: process.env.REACT_APP_COMMENTS_SERVICE_URL || '/comments',
  queryServiceUrl: process.env.REACT_APP_QUERY_SERVICE_URL || '/query',
};

export default config;
