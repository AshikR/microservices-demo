import React, { useState } from "react";
import axios from "axios";
import config from "./config";

const CommentCreate = ({ postId, onCommentCreated }) => {
  const [content, setContent] = useState("");

  const onSubmit = async (event) => {
    event.preventDefault();
    await axios.post(
      `${config.commentsServiceUrl}/posts/${postId}/comments`,
      { content }
    );
    setContent("");
    if (onCommentCreated) onCommentCreated();
  };

  return (
    <form onSubmit={onSubmit} className="comment-form">
      <input
        value={content}
        onChange={(e) => setContent(e.target.value)}
        placeholder="Write comment..."
      />
      <button type="submit">Add Comment</button>
    </form>
  );
};

export default CommentCreate;
