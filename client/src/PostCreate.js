import React, { useState } from "react";
import axios from "axios";
import config from "./config";

const PostCreate = ({ onPostCreated }) => {
  const [title, setTitle] = useState("");

  const onSubmit = async (event) => {
    event.preventDefault();
    await axios.post(`${config.postsServiceUrl}/post/create`, {
      title,
    });
    setTitle("");
    if (onPostCreated) onPostCreated();
  };

  return (
    <div className="create-post-card">
      <h1>Create Post</h1>
      <form onSubmit={onSubmit} className="post-form">
        <input
          value={title}
          onChange={(e) => setTitle(e.target.value)}
          placeholder="Enter your post..."
        />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
};

export default PostCreate;
