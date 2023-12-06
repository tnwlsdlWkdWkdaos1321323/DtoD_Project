// PostListPage.js
import React, { useEffect, useState } from 'react';

const PostListPage = () => {
  const [posts, setPosts] = useState([]);
  const [totalPages, setTotalPages] = useState(0);
  const [currentPage, setCurrentPage] = useState(1);

  useEffect(() => {
    fetchPosts();
  }, [currentPage]);

  const fetchPosts = async () => {
    const response = await fetch(`http://localhost:9005/admin/adminNotice?page=${currentPage - 1}`);
    const data = await response.json();
    setPosts(data.content);
    setTotalPages(data.totalPages);
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  return (
    <div>
      <h1>Post List</h1>
      {posts.map((post) => (
        <div key={post.id}>
          <h3>{post.title}</h3>
          <p>{post.content}</p>
        </div>
      ))}
      {/* <ANoticePaging totalPages={totalPages} currentPage={currentPage} onPageChange={handlePageChange} /> */}
    </div>
  );
};

export default PostListPage;