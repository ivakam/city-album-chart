// Generated by CoffeeScript 1.10.0
(function() {
  $(document).on("turbolinks:load", function() {
    var albumClick, albumOpen, albumSort, albums, checkMatch, clickImage, delayTimer, displayAlbum, escapeRegExp, loadedAlbums, masterAlbums, masterTracks, populateAlbums, toggleAlbum, tracks;
    if ($("body").hasClass("albums index")) {
      window.albumsNameSpace = {};
      populateAlbums = function() {
        var jsonAlbums, jsonTracks;
        if (typeof gon !== "undefined") {
          jsonAlbums = JSON.stringify(gon.Albums);
          jsonTracks = JSON.stringify(gon.Tracks);
        }
        localStorage.setItem("Albums", jsonAlbums);
        return localStorage.setItem("Tracks", jsonTracks);
      };
      populateAlbums();
      masterAlbums = JSON.parse(localStorage.getItem("Albums"));
      masterTracks = JSON.parse(localStorage.getItem("Tracks"));
      masterAlbums = masterAlbums.sort(function(a, b) {
        var compA, compB;
        compA = parseInt(a.quality);
        compB = parseInt(b.quality);
        return compB - compA;
      });
      albums = masterAlbums;
      tracks = masterTracks;
      albumOpen = false;
      delayTimer = null;
      loadedAlbums = 0;
      toggleAlbum = function(title, sibling, parent, arrow) {
        var timeout;
        $(".album-arrow").css("transform", "rotate(0)");
        $(".album-container").css("height", "327px");
        $(".info-wrapper").css("display", "none");
        $(".info-container").css("display", "none");
        $(".info-wrapper").css("height", "0");
        $(".album-container").find("img").removeClass("image-border");
        if (sibling !== void 0 && !sibling.hasClass("is-open")) {
          timeout = 0;
          if (albumOpen) {
            timeout = 300;
          }
          parent.find("img").addClass("image-border");
          return setTimeout(function() {
            var img, newWidth, offset, trackContainer;
            offset = parent.offset().top + 95;
            arrow.css("transform", "rotate(180deg)");
            parent.css("height", "800px");
            sibling.css("display", "flex");
            sibling.parent().css("display", "block");
            sibling.css("height", "400px");
            $(".offset").css("top", offset);
            sibling.parent().addClass("offset");
            $(".info-wrapper").attr("class", "info-wrapper");
            sibling.addClass("is-open");
            img = sibling.find("img").attr("src");
            sibling.find(".info-background img").css("display", "block");
            trackContainer = sibling.find(".tracklist-container");
            newWidth = Math.ceil(trackContainer.children().length / 8) * 235 + 5;
            if (trackContainer.width() !== newWidth) {
              trackContainer.width(newWidth + 30);
            }
            return albumOpen = true;
          }, timeout);
        } else {
          albumOpen = false;
          return $(".info-wrapper").removeClass("is-open");
        }
      };
      albumClick = function(e) {
        var arrow, parent, sibling, title;
        title = e.closest(".album-container").attr("id");
        sibling = $("#" + title + "-info").find(".info-wrapper");
        parent = $("#" + title);
        arrow = parent.find(".album-arrow");
        return toggleAlbum(title, sibling, parent, arrow);
      };
      clickImage = function(e) {
        var img, imgsrc, offset, opacity;
        opacity = $("#opaque");
        img = $(".bigimage");
        imgsrc = e.attr("src");
        if (!img.hasClass("enlargened")) {
          img.addClass("enlargened");
          img.attr("src", imgsrc);
          offset = img.width() / 2;
          $(".enlargened").css("left", ($(window).width() / 2) - offset);
          $(".enlargened").css("top", ($(window).height() / 2) - offset);
          opacity.css("background", "rgba(0, 0, 0, 0.6");
          return opacity.css("z-index", "4");
        }
      };
      displayAlbum = function(min, max, refreshSplash) {
        var createAlbum, i, j, ref, ref1;
        if (refreshSplash == null) {
          refreshSplash = true;
        }
        if (refreshSplash) {
          $("#splash-container").toggle();
        }
        createAlbum = function(i) {
          var addTrack, albumID, albumLi, albumTracks, currentAlbum, j, k, len, len1, track;
          currentAlbum = albums[i];
          albumID = currentAlbum.id;
          albumTracks = [];
          albumLi = "<li> <div class='album-container' id='" + albumID + "'> <div class='album-text-container'> <div class='text-size-wrapper'> <h2>" + currentAlbum.title + "</h2> </div> <img src='" + currentAlbum.coverlink + "'> <div class='artist-year-container'> <p class='artist'>" + currentAlbum.romaji_artist + "</p> <p class='year'>" + currentAlbum.year + "</p> </div> </div> <div class='arrow-container'><span class='ion-chevron-down album-arrow'></span></div> </div> <div class='info-container offset' id='" + albumID + "-info'> <div class='info-wrapper'> <div class='info-background'>" + "<img src='" + currentAlbum.coverlink + "'></div> <div class='info-text-container'> <div class='text-container'> <div class='title-container'> <h2>" + currentAlbum.title + "</h2> <h3><i>" + currentAlbum.romanization + "</i></h3> </div> <div class='artist-container'> <p class='label'>Artist:</p> <p>" + currentAlbum.romaji_artist + "</p> <p class='label'>" + currentAlbum.japanese_artist + "</p> </div> <div class='release-date'> <p class='label'>Release date:</p> <p>" + currentAlbum.year + "</p> </div> <div class='flavor'> <p class='label'>Flavor:</p> <p class='flavor-value'>" + currentAlbum.flavor + "</p> </div> <div class='description-container'> <p class='label'>Description:</p> <p class='description'>" + currentAlbum.description + "</p> </div> </div> <div class='track-grow-wrapper'> <div class='tracklist-wrapper'> <h3>Tracklist:</h3> <ul class='tracklist-container'> </ul> </div> </div> </div> <img class='expandable-img' src='" + currentAlbum.coverlink + "'> </div> </div> </li>";
          $("#splash-container").append(albumLi);
          $("#" + albumID + "-info .expandable-img").get()[0].addEventListener("click", function(e) {
            return clickImage($(this));
          });
          $("#" + albumID + " .arrow-container").get()[0].addEventListener("click", function(e) {
            return albumClick($(this));
          });
          $("#" + albumID + " img").get()[0].addEventListener("click", function(e) {
            return albumClick($(this));
          });
          for (j = 0, len = tracks.length; j < len; j++) {
            track = tracks[j];
            if (track.album_id === albumID) {
              albumTracks.push(track);
            }
          }
          addTrack = function(track, i) {
            return $("#" + albumID + "-info").find(".tracklist-container").append("<li class='track-container'> <div class='track-title-container'> <p>" + (i + 1) + ".</p> <div class='track-title-wrap'> <p>" + track.title + "</p> <i>" + track.romanization + "</i> </div> </div> <p class='duration'>" + track.duration + "</p> </li>");
          };
          for (i = k = 0, len1 = albumTracks.length; k < len1; i = ++k) {
            track = albumTracks[i];
            addTrack(track, i);
          }
          return loadedAlbums++;
        };
        for (i = j = ref = min, ref1 = max; ref <= ref1 ? j < ref1 : j > ref1; i = ref <= ref1 ? ++j : --j) {
          createAlbum(i);
        }
        if (refreshSplash) {
          return $("#splash-container").show(400, function() {
            return $(".text-size-wrapper h2, .artist-year-container p").each(function() {
              var fontSize, padding, results;
              fontSize = 20;
              results = [];
              while ($(this).width() > $(this).parent().width()) {
                $(this).css("font-size", fontSize -= 0.5);
                results.push(padding = Math.pow(fontSize, -fontSize * 0.6));
              }
              return results;
            });
          });
        } else {
          return $(".text-size-wrapper h2, .artist-year-container p").each(function() {
            var fontSize, padding, results;
            fontSize = 20;
            results = [];
            while ($(this).width() > $(this).parent().width()) {
              $(this).css("font-size", fontSize -= 0.5);
              results.push(padding = Math.pow(fontSize, -fontSize * 0.6));
            }
            return results;
          });
        }
      };
      window.albumsNameSpace.displayAlbum = displayAlbum;
      displayAlbum(0, 40);
      window.albumsNameSpace.albumTotalCount = masterAlbums.length;
      $("#album-total-count").text(masterAlbums.length);
      $("#random").click(function(event) {
        var arrow, container, id, ids, parent, random, sibling, timer, title;
        ids = [];
        $(".album-container").each(function() {
          return ids.push($(this).attr("id"));
        });
        random = Math.floor(Math.random() * ids.length);
        id = ids[random];
        container = $("#" + id);
        title = id;
        sibling = container.siblings("#" + title + "-info").find(".info-wrapper");
        parent = container;
        arrow = container.find(".album-arrow");
        toggleAlbum(title, sibling, parent, arrow);
        if (albumOpen) {
          timer = 300;
        } else {
          timer = 0;
        }
        return setTimeout(function() {
          return $(container).get()[0].scrollIntoView({
            behaviour: "smooth"
          });
        }, timer);
      });
      $("#opaque").click(function() {
        $("img").removeClass("enlargened");
        $(this).css("background", "rgba(0,0,0,0)");
        $(".bigimage").attr("src", "");
        return $(this).css("z-index", "0");
      });
      $(".sort-btn").click(function() {
        var clickedArrow;
        clickedArrow = $(this).children("a").text();
        $("#sort-list li").each(function() {
          if ($(this).children("a").text() !== clickedArrow) {
            return $(this).find(".ion-chevron-down").removeClass("rotated");
          }
        });
        $(this).find(".ion-chevron-down").toggleClass("rotated");
        return albumSort($(this).children("a").text());
      });
      $("#regex").click(function() {
        var regex;
        regex = $(this);
        regex.toggleClass("brightness");
        return regex.toggleClass("gray");
      });
      window.albumsNameSpace.search = function(input) {
        return new Promise(function(resolve) {
          var album, doSearch, i, inputValues, j, len, rawInput, tempAlbums;
          loadedAlbums = 40;
          toggleAlbum({
            sibling: void 0
          });
          rawInput = $(input).val();
          inputValues = rawInput.split(/,/);
          for (i in inputValues) {
            inputValues[i] = inputValues[i].trim();
          }
          albums = masterAlbums;
          tracks = masterTracks;
          if ($(input).data("lastval") !== rawInput) {
            $(input).data("lastval", rawInput);
            $("#splash-container").empty();
            if (rawInput !== "") {
              doSearch = function(album) {
                var albumValues, j, k, len, len1, matchValues, ref, track, trackValues, val;
                albumValues = [];
                ref = Object.values(album);
                for (j = 0, len = ref.length; j < len; j++) {
                  val = ref[j];
                  if (typeof val !== "number") {
                    albumValues.push(val);
                  }
                }
                trackValues = [];
                for (k = 0, len1 = tracks.length; k < len1; k++) {
                  track = tracks[k];
                  if (track.album_id === album.id) {
                    trackValues.push(track.title, track.romanization);
                  }
                }
                matchValues = albumValues.concat(trackValues);
                if (checkMatch(matchValues, inputValues)) {
                  return tempAlbums.push(album);
                }
              };
              tempAlbums = [];
              for (j = 0, len = albums.length; j < len; j++) {
                album = albums[j];
                doSearch(album);
              }
              albums = tempAlbums;
              asyncDisplayAlbum(0, albums.length);
            } else {
              asyncDisplayAlbum(0, 40);
            }
          }
          return resolve("resolved");
        });
      };
      $("#main-search").on("input", function(e) {
        clearTimeout(delayTimer);
        return delayTimer = setTimeout(function() {
          return asyncSearch(e);
        }, 200);
      });
      checkMatch = function(values, conditions) {
        var blackList, conditionCount, j, k, len, len1, match, val;
        blackList = [];
        conditionCount = [];
        for (j = 0, len = conditions.length; j < len; j++) {
          val = conditions[j];
          conditionCount.push(false);
        }
        match = function(value, conditions) {
          var compCond, compConditions, compValue, cond, k, l, len1, len2, len3, len4, m, n, regexCond, results, results1, testSuccess;
          compConditions = [];
          if ($("#regex").hasClass("brightness")) {
            for (k = 0, len1 = conditions.length; k < len1; k++) {
              cond = conditions[k];
              compConditions.push(new RegExp(cond));
            }
            testSuccess = function(regexCond) {
              blackList.push(regexCond.source);
              return conditionCount[conditionCount.findIndex(function(element) {
                return element === false;
              })] = true;
            };
            results = [];
            for (l = 0, len2 = compConditions.length; l < len2; l++) {
              regexCond = compConditions[l];
              if (regexCond.test(value) && blackList.find(function(element) {
                return element === regexCond.source;
              }) === void 0) {
                results.push(testSuccess(regexCond));
              }
            }
            return results;
          } else {
            compValue = escapeRegExp(value).toUpperCase();
            for (m = 0, len3 = conditions.length; m < len3; m++) {
              cond = conditions[m];
              compConditions.push(escapeRegExp(cond).toUpperCase());
            }
            testSuccess = function(compCond) {
              blackList.push(compCond);
              return conditionCount[conditionCount.findIndex(function(element) {
                return element === false;
              })] = true;
            };
            results1 = [];
            for (n = 0, len4 = compConditions.length; n < len4; n++) {
              compCond = compConditions[n];
              if (compValue.match(compCond) !== null && blackList.find(function(element) {
                return element === compCondition;
              }) === void 0) {
                results1.push(testSuccess(compCond));
              }
            }
            return results1;
          }
        };
        for (k = 0, len1 = values.length; k < len1; k++) {
          val = values[k];
          if (!(conditionCount.find(function(element) {
            return element === false;
          }) === void 0)) {
            match(val, conditions);
          }
        }
        if (conditionCount.find(function(element) {
          return element === false;
        }) === void 0) {
          return true;
        } else {
          return false;
        }
      };
      escapeRegExp = function(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      };
      albumSort = function(string) {
        var albumList;
        albumList = $("#splash-container");
        albumList.empty();
        switch (string) {
          case "Title":
            if (!albumList.hasClass("title-sorted-up") && !albumList.hasClass("title-sorted-down")) {
              albumList.attr("class", "title-sorted-down");
            }
            if (albumList.hasClass("title-sorted-up")) {
              albumList.attr("class", "title-sorted-down");
            } else {
              albumList.attr("class", "title-sorted-up");
            }
            albums = albums.sort(function(a, b) {
              var compA, compB;
              compA = a.title.toUpperCase();
              compB = b.title.toUpperCase();
              if (albumList.hasClass("title-sorted-up")) {
                return compA.localeCompare(compB);
              } else {
                return compB.localeCompare(compA);
              }
            });
            break;
          case "Artist":
            if (!albumList.hasClass("artist-sorted-up") && !albumList.hasClass("artist-sorted-down")) {
              albumList.attr("class", "artist-sorted-down");
            }
            if (albumList.hasClass("artist-sorted-up")) {
              albumList.attr("class", "artist-sorted-down");
            } else {
              albumList.attr("class", "artist-sorted-up");
            }
            albums = albums.sort(function(a, b) {
              var compA, compB;
              compA = a.romaji_artist.toUpperCase();
              compB = b.romaji_artist.toUpperCase();
              if (albumList.hasClass("artist-sorted-up")) {
                return compA.localeCompare(compB);
              } else {
                return compB.localeCompare(compA);
              }
            });
            break;
          case "Year":
            if (!albumList.hasClass("year-sorted-up") && !albumList.hasClass("year-sorted-down")) {
              albumList.attr("class", "year-sorted-down");
            }
            if (albumList.hasClass("year-sorted-up")) {
              albumList.attr("class", "year-sorted-down");
            } else {
              albumList.attr("class", "year-sorted-up");
            }
            albums = albums.sort(function(a, b) {
              var compA, compB;
              compA = parseInt(a.year);
              compB = parseInt(b.year);
              if (albumList.hasClass("year-sorted-up")) {
                return compA - compB;
              } else {
                return compB - compA;
              }
            });
            break;
          case "Flavor":
            if (!albumList.hasClass("flavor-sorted-up") && !albumList.hasClass("flavor-sorted-down")) {
              albumList.attr("class", "flavor-sorted-down");
            }
            if (albumList.hasClass("flavor-sorted-up")) {
              albumList.attr("class", "flavor-sorted-down");
            } else {
              albumList.attr("class", "flavor-sorted-up");
            }
            albums = albums.sort(function(a, b) {
              var compA, compB;
              compA = a.flavor.toUpperCase();
              compB = b.flavor.toUpperCase();
              if (albumList.hasClass("flavor-sorted-up")) {
                return compA.localeCompare(compB);
              } else {
                return compB.localeCompare(compA);
              }
            });
            break;
          case "Quality":
            if (!albumList.hasClass("quality-sorted-up") && !albumList.hasClass("quality-sorted-down")) {
              albumList.attr("class", "quality-sorted-down");
            }
            if (albumList.hasClass("quality-sorted-up")) {
              albumList.attr("class", "quality-sorted-down");
            } else {
              albumList.attr("class", "quality-sorted-up");
            }
            albums = albums.sort(function(a, b) {
              var compA, compB;
              compA = parseInt(a.quality);
              compB = parseInt(b.quality);
              if (albumList.hasClass("quality-sorted-up")) {
                return compA - compB;
              } else {
                return compB - compA;
              }
            });
            break;
        }
        loadedAlbums = 0;
        toggleAlbum({
          sibling: void 0
        });
        if (albums.length >= 40) {
          return displayAlbum(0, 40);
        } else {
          return displayAlbum(0, albums.length);
        }
      };
      return $(window).scroll(function() {
        var albumsToLoad;
        if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
          albumsToLoad = albums.length - loadedAlbums;
          if (albumsToLoad >= 40) {
            return displayAlbum(loadedAlbums, loadedAlbums + 40, false);
          } else {
            if (albumsToLoad < 40 && albumsToLoad > 0) {
              return displayAlbum(loadedAlbums, loadedAlbums + albumsToLoad, false);
            } else {

            }
          }
        }
      });
    }
  });

}).call(this);
