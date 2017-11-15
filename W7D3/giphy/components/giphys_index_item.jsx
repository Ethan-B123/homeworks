import React from 'react';

export default ({ giphy }) => {
  return (
    <li>
      <img src={giphy.images.fixed_height.url} />
    </li>
  );
};
