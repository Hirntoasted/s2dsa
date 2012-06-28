  
  var Gallery = function($node, id) {
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
        pos = style($list.get(0), "left")
        $first = $items.eq(first),
        $last = $items.eq(last),
        unused = true;
    
    var update = function() {
      listwidth = style($list.get(0), "width");
      itemwidth = style($items.get(0), "width");
      itemwidthpx = $items.eq(0).width();
      tomove =  (listwidth * itemwidth / 100);
      
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
      
      $items.eq(center).removeClass("active");
      --center >= 0 || (center = itemcount - 1);
      $items.eq(center).addClass("active");
      $list.attr("id", "active-look-" + id + "-" + center);
      
      $list.get(0).style["left"] = Math.round((pos += tomove) * 10000) / 10000 + unit;
    };
    
    var next = function() {    
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
      
      $items.eq(center).removeClass("active");
      ++center < itemcount || (center = 0);
      $items.eq(center).addClass("active");
      $list.attr("id", "active-look-" + id + "-" + center);
      
      $list.get(0).style["left"] = Math.round((pos -= tomove) * 10000) / 10000 + unit;
    };
    
    this.update = function() {
      update();
    };
    
    $node.on("click", ".pager", function(e) {
      $($list).find(".active .info").removeClass("show");
      $(this).is(".next") ? next() : prev();
      return false;
    });
    
  };
  
    
$(".js_gallery").each(function() {
  new Gallery($(this), 0);
});
  
