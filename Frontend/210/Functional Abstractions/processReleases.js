function processReleaseData(data) {
  return data.filter(function(release) {
    return release.id && release.title;
  }).map(function(release) {
    return {
      id: release.id,
      title: release.title
    }
  });
}

