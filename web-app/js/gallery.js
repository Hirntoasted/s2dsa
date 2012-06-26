amq.widget("gallery", function($win, $doc) {
  var $content = $doc.find(".content"),
      galleries = [], id = 0;
  
  var cssprop = Modernizr.csstransforms ? Modernizr.prefixed("transform") : "left",
      cssval = Modernizr.csstransforms ? ["translateX(", ")"] : ["", ""];
  
  var Carousel = function($node, id, type) {
    var $list = $node.find(".js_list"),
        $items = $list.children(),
        itemcount = $items.length;
    if (!itemcount) { return; }
    
    var unit, val, listwidth, itemwidth, itemwidthpx, tomove,
        frameleft, framewidth, frameright, framefit,
        firstoffset, firstleft, lastoffset, lastleft,
        offsettest,
        firstvisible, lastvisible, tounstash, tostash;
    
    var style = function(node, attr) {
      val = node.style[attr] || (window.getComputedStyle ? window.getComputedStyle(node) : node.currentStyle)[attr];
      return (unit ? val.replace(/(?:px|%)$/, "") : val.replace(/(px|%)$/, function(str, match) {
        unit = match;
        return "";
      })) * 1;
    };
    
    var $frame = $list.parent(),
        first = (itemcount % 2 ? itemcount + 1 : itemcount) / 2,
        last = first - 1,
        center = 0,
        pos = Modernizr.csstransforms ? 0 : style($list.get(0), "left"),
        $first = $items.eq(first),
        $last = $items.eq(last),
        unused = true;
    
    var update = function() {
      listwidth = style($list.get(0), "width");
      itemwidth = style($items.get(0), "width");
      itemwidthpx = $items.eq(0).width();
      tomove = Modernizr.csstransforms || unit === "px" ? itemwidth : (listwidth * itemwidth / 100);
      
      frameleft = $frame.offset().left;
      framewidth = $frame.width();
      frameright = framewidth + frameleft;
      framefit = Math.ceil(framewidth / itemwidthpx);
      
      firstoffset = $first.offset().left;
      firstleft = style($first.get(0), "left");
      lastoffset = $last.offset().left + itemwidthpx;
      lastleft = style($last.get(0), "left");
      
      for (var i = itemcount - 1; i >= 0; --i) {
        if ($items.eq(i).offset().left + itemwidthpx <= frameleft) { break; }
        firstvisible = i;
      }
      for (var i = 0; i < itemcount; ++i) {
        if ($items.eq(i).offset().left >= frameright) { break; }
        lastvisible = i;
      }
    };
    update();
    
    var prev = function() {
      unused && $list.removeClass("shim") && (unused = false);
      if (itemcount > framefit + 2) {
        --firstvisible >= 0 || (firstvisible = itemcount - 1);
        tounstash = firstvisible - 1;
        tounstash >= 0 || (tounstash = tounstash + itemcount);
        $items.eq(tounstash).find("img").data("stashitem").unstash();
        
        --lastvisible >= 0 || (lastvisible = itemcount - 1);
        tostash = lastvisible + 2;
        tostash < itemcount || (tostash = tostash - itemcount);
        $items.eq(tostash).find("img").data("stashitem").stash();
      }
      
      offsettest = firstoffset += itemwidthpx;
      itemcount > framefit + 1 && (offsettest += itemwidthpx);
      if (offsettest > frameleft) {
        $items.eq(last).css("left", (firstleft -= itemwidth) + unit);
        lastleft -= itemwidth;
        firstoffset -= itemwidthpx;
        --first >= 0 || (first = itemcount - 1);
        --last >= 0 || (last = itemcount - 1);
      } else {
        lastoffset += itemwidthpx;
      }
      
      $items.eq(center + 1 < itemcount ? center + 1 : 0).removeClass("active");
      --center >= 0 || (center = itemcount - 1);
      $items.eq(center - 1 >= 0 ? center - 1 : itemcount - 1).addClass("active");
      $list.attr("id", "active-look-" + id + "-" + (type ? "large" : "thumb") + "-" + center);
      
      $list.get(0).style[cssprop] = cssval.join(Math.round((pos += tomove) * 10000) / 10000 + unit);
    };
    
    var next = function() {
      unused && $list.removeClass("shim") && (unused = false);
      if (itemcount > framefit + 2) {
        ++lastvisible < itemcount || (lastvisible = 0);
        tounstash = lastvisible + 1;
        tounstash < itemcount || (tounstash = tounstash - itemcount);
        $items.eq(tounstash).find("img").data("stashitem").unstash();
        
        ++firstvisible < itemcount || (firstvisible = 0);
        tostash = firstvisible - 2;
        tostash >= 0 || (tostash = tostash + itemcount);
        $items.eq(tostash).find("img").data("stashitem").stash();
      }
      
      offsettest = lastoffset -= itemwidthpx;
      itemcount > framefit + 1 && (offsettest -= itemwidthpx);
      if (offsettest < frameright) {
        $items.eq(first).css("left", (lastleft += itemwidth) + unit);
        firstleft += itemwidth;
        lastoffset += itemwidthpx;
        ++last < itemcount || (last = 0);
        ++first < itemcount || (first = 0);
      } else {
        firstoffset -= itemwidthpx;
      }
      
      $items.eq(center - 1 >= 0 ? center - 1 : itemcount - 1).removeClass("active");
      ++center < itemcount || (center = 0);
      $items.eq(center + 1 < itemcount ? center + 1 : 0).addClass("active");
      $list.attr("id", "active-look-" + id + "-" + (type ? "large" : "thumb") + "-" + center);
      
      $list.get(0).style[cssprop] = cssval.join(Math.round((pos -= tomove) * 10000) / 10000 + unit);
    };
    
    this.update = function() {
      update();
    };
    
    $node.on("click", ".pager li, .contentpager li", function(e) {
      var direction = $(this).index();
      direction ? next() : prev();
      amq.publish(["gallery", id, type, "slide"].join(":"), direction);
      return false;
    });
    
    amq.subscribe(["gallery", id, !type, "slide"].join(":"), function(direction) {
      direction ? next() : prev();
    });
    
    type || $list.on("click", ".js_list > li", function(e) {
      var idx = $(this).index(),
          diff = center - idx,
          absdiff = Math.abs(diff),
          donext = diff < 0;
      absdiff < itemcount / 2 || (absdiff = itemcount - absdiff, donext = !donext);
      
      for (var i = 0; i < absdiff; ++i) {
        (donext ? next : prev).call();
        amq.publish(["gallery", id, type, "slide"].join(":"), donext);
      }
    });
  };
  
  var Gallery = function($node) {
    this.id = id++;
    
    var large = new Carousel($node, this.id, !0),
        thumb = new Carousel($node.next(".promodrawer"), this.id, !!0);
    
    this.update = function() {
      large.update();
      thumb.update();
    };
    
    $node.on("click touchstart", ".js_show", function(e) {
      $(this).parents(".item").find(".js_productinfo").addClass("show").removeClass("hide");
    });
    
    $node.on("click touchstart", ".js_hide", function(e) {
      $(this).parents(".js_productinfo").addClass("hide").removeClass("show");
    });
  };
  
  amq.subscribe("amq:ready ajax:inserted", function($nodes) {
    $nodes.filter(".js_gallery").add($nodes.find(".js_gallery")).each(function() {
      galleries.push(new Gallery($(this)));
    });
  });
  
  /*$win.on("resize", function(e) {
    for (var i in galleries) {
      galleries[i].update();
    }
  });*/
});
