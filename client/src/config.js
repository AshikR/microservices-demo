const config = {
  postsServiceUrl: process.env.REACT_APP_POSTS_SERVICE_URL || 'http://localhost:8001',
  commentsServiceUrl: process.env.REACT_APP_COMMENTS_SERVICE_URL || 'http://localhost:8002',
  queryServiceUrl: process.env.REACT_APP_QUERY_SERVICE_URL || 'http://localhost:8003',
};

export default config;
