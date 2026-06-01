import React, { useState, useEffect } from "react";
import axios from "axios";
import CommentCreate from "./CommentCreate";
import CommentList from "./CommentList";
import config from "./config";

const PostList = () => {
  const [posts, setPosts] = useState({});

  const fetchPosts = async () => {
    const res = await axios.get(`${config.queryServiceUrl}/posts`);
    setPosts(res.data.data);
  };

  useEffect(() => {
    fetchPosts();
  }, []);

  return (
    <div className="posts-grid">
      {Object.values(posts).map((post) => (
        <div className="post-card" key={post.id}>
          <h2>{post.title}</h2>
          <CommentList comments={post.comments || []} />
          <CommentCreate
            postId={post.id}
            onCommentCreated={fetchPosts}
          />
        </div>
      ))}
    </div>
  );
};

export default PostList;
