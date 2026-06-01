import React, { useState } from 'react';
import PostCreate from './PostCreate';
import PostList from './PostList';
import './index.css';

export default function App() {
  const [refreshKey, setRefreshKey] = useState(0);

  const handlePostCreated = () => {
    setRefreshKey(prev => prev + 1);
  };

  return (
    <div className="app">
      <PostCreate onPostCreated={handlePostCreated} />
      <PostList key={refreshKey} />
    </div>
  );
}
