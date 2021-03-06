/**
 * jquery.Jcrop.js v0.9.8
 * jQuery Image Cropping Plugin
 * @author Kelly Hallman <khallman@gmail.com>
 * Copyright (c) 2008-2009 Kelly Hallman - released under MIT License {{{
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:

 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.

 * }}}
 */
!function(e){e.Jcrop=function(t,n){/*}}}*/
// }}}
// Internal Methods {{{
function r(e){return""+parseInt(e)+"px"}function s(e){return""+parseInt(e)+"%"}function o(e){return B.baseClass+"-"+e}function a(t){
// Updated in v0.9.4 to use built-in dimensions plugin
var n=e(t).offset();return[n.left,n.top]}/*}}}*/
function c(e){return[e.pageX-se[0],e.pageY-se[1]]}/*}}}*/
function u(e){e!=N&&(ae.setCursor(e),
//Handles.xsetCursor(type);
N=e)}/*}}}*/
function d(e,t){if(se=a(W),ae.setCursor("move"==e?e:e+"-resize"),"move"==e)return ae.activateHandlers(f(t),m);var n=oe.getFixed(),r=p(e),s=oe.getCorner(p(r));oe.setPressed(oe.getCorner(r)),oe.setCurrent(s),ae.activateHandlers(l(e,n),m)}/*}}}*/
function l(e,t){return function(n){if(B.aspectRatio)switch(e){case"e":n[1]=t.y+1;break;case"w":n[1]=t.y+1;break;case"n":n[0]=t.x+1;break;case"s":n[0]=t.x+1}else switch(e){case"e":n[1]=t.y2;break;case"w":n[1]=t.y2;break;case"n":n[0]=t.x2;break;case"s":n[0]=t.x2}oe.setCurrent(n),ie.update()}}/*}}}*/
function f(e){var t=e;return ce.watchKeys(),function(e){oe.moveOffset([e[0]-t[0],e[1]-t[1]]),t=e,ie.update()}}/*}}}*/
function p(e){switch(e){case"n":return"sw";case"s":return"nw";case"e":return"nw";case"w":return"ne";case"ne":return"sw";case"nw":return"se";case"se":return"nw";case"sw":return"ne"}}/*}}}*/
function b(e){return function(t){return B.disabled?!1:"move"!=e||B.allowMove?(L=!0,d(e,c(t)),t.stopPropagation(),t.preventDefault(),!1):!1}}/*}}}*/
function v(e,t,n){var r=e.width(),s=e.height();r>t&&t>0&&(r=t,s=t/e.width()*e.height()),s>n&&n>0&&(s=n,r=n/e.height()*e.width()),q=e.width()/r,G=e.height()/s,e.width(r).height(s)}/*}}}*/
function g(e){return{x:parseInt(e.x*q),y:parseInt(e.y*G),x2:parseInt(e.x2*q),y2:parseInt(e.y2*G),w:parseInt(e.w*q),h:parseInt(e.h*G)}}/*}}}*/
function m(e){var t=oe.getFixed();t.w>B.minSelect[0]&&t.h>B.minSelect[1]?(ie.enableHandles(),ie.done()):ie.release(),ae.setCursor(B.allowSelect?"crosshair":"default")}/*}}}*/
function y(e){if(B.disabled)return!1;if(!B.allowSelect)return!1;L=!0,se=a(W),ie.disableHandles(),u("crosshair");var t=c(e);return oe.setPressed(t),ae.activateHandlers(x,m),ce.watchKeys(),ie.update(),e.stopPropagation(),e.preventDefault(),!1}/*}}}*/
function x(e){oe.setCurrent(e),ie.update()}/*}}}*/
function C(){var t=e("<div></div>").addClass(o("tracker"));return e.browser.msie&&t.css({opacity:0,backgroundColor:"white"}),t}
// }}}
// API methods {{{
function S(e){function t(){window.setTimeout(g,u)}var n=e[0]/q,r=e[1]/G,s=e[2]/q,o=e[3]/G;if(!U){var i=oe.flipCoords(n,r,s,o),a=oe.getFixed(),c=initcr=[a.x,a.y,a.x2,a.y2],u=B.animationDelay,d=c[0],l=c[1],s=c[2],o=c[3],f=i[0]-initcr[0],h=i[1]-initcr[1],p=i[2]-initcr[2],w=i[3]-initcr[3],b=0,v=B.swingSpeed;ie.animMode(!0);var g=function(){return function(){b+=(100-b)/v,c[0]=d+b/100*f,c[1]=l+b/100*h,c[2]=s+b/100*p,c[3]=o+b/100*w,100>b?t():ie.done(),b>=99.8&&(b=100),z(c)}}();t()}}/*}}}*/
function k(e){z([e[0]/q,e[1]/G,e[2]/q,e[3]/G])}
//}}}
function z(e){oe.setPressed([e[0],e[1]]),oe.setCurrent([e[2],e[3]]),ie.update()}/*}}}*/
function M(t){"object"!=typeof t&&(t={}),B=e.extend(B,t),"function"!=typeof B.onChange&&(B.onChange=function(){}),"function"!=typeof B.onSelect&&(B.onSelect=function(){})}/*}}}*/
function I(){return g(oe.getFixed())}/*}}}*/
function H(){return oe.getFixed()}/*}}}*/
function O(e){M(e),R()}/*}}}*/
function D(){B.disabled=!0,ie.disableHandles(),ie.setCursor("default"),ae.setCursor("default")}
//}}}
function F(){B.disabled=!1,R()}
//}}}
function P(){ie.done(),ae.activateHandlers(null,null)}
//}}}
function J(){T.remove(),K.show()}
//}}}
function R(e){B.allowResize?e?ie.enableOnly():ie.enableHandles():ie.disableHandles(),ae.setCursor(B.allowSelect?"crosshair":"default"),ie.setCursor(B.allowMove?"move":"default"),T.css("backgroundColor",B.bgColor),"setSelect"in B&&(k(n.setSelect),ie.done(),delete B.setSelect),"trueSize"in B&&(q=B.trueSize[0]/A,G=B.trueSize[1]/E),V=B.maxSize[0]||0,Q=B.maxSize[1]||0,X=B.minSize[0]||0,Y=B.minSize[1]||0,"outerImage"in B&&(W.attr("src",B.outerImage),delete B.outerImage),ie.refresh()}
// Initialization {{{
// Sanitize some options {{{
var t=t,n=n;"object"!=typeof t&&(t=e(t)[0]),"object"!=typeof n&&(n={}),
// Some on-the-fly fixes for MSIE...sigh
"trackDocument"in n||(n.trackDocument=e.browser.msie?!1:!0,e.browser.msie&&"8"==e.browser.version.split(".")[0]&&(n.trackDocument=!0)),"keySupport"in n||(n.keySupport=e.browser.msie?!1:!0);
// }}}
// Extend the default options {{{
var j={
// Basic Settings
trackDocument:!1,baseClass:"jcrop",addClass:null,
// Styling Options
bgColor:"black",bgOpacity:.6,borderOpacity:.4,handleOpacity:.5,handlePad:5,handleSize:9,handleOffset:5,edgeMargin:14,aspectRatio:0,keySupport:!0,cornerHandles:!0,sideHandles:!0,drawBorders:!0,dragEdges:!0,boxWidth:0,boxHeight:0,boundary:8,animationDelay:20,swingSpeed:3,allowSelect:!0,allowMove:!0,allowResize:!0,minSelect:[0,0],maxSize:[0,0],minSize:[0,0],
// Callbacks / Event Handlers
onChange:function(){},onSelect:function(){}},B=j;M(n);
// }}}
// Initialize some jQuery objects {{{
var K=e(t),W=K.clone().removeAttr("id").css({position:"absolute"});W.width(K.width()),W.height(K.height()),K.after(W).hide(),v(W,B.boxWidth,B.boxHeight);var A=W.width(),E=W.height(),T=e("<div />").width(A).height(E).addClass(o("holder")).css({position:"relative",backgroundColor:B.bgColor}).insertAfter(K).append(W);B.addClass&&T.addClass(B.addClass);
//$img.wrap($div);
var V,Q,X,Y,q,G,
// Internal states
L,N,U,Z,$=e("<img />").attr("src",W.attr("src")).css("position","absolute").width(A).height(E),_=e("<div />").width(s(100)).height(s(100)).css({zIndex:310,position:"absolute",overflow:"hidden"}).append($),ee=e("<div />").width(s(100)).height(s(100)).css("zIndex",320),te=e("<div />").css({position:"absolute",zIndex:300}).insertBefore(W).append(_,ee),ne=B.boundary,re=C().width(A+2*ne).height(E+2*ne).css({position:"absolute",top:r(-ne),left:r(-ne),zIndex:290}).mousedown(y),se=a(W),oe=function(){function e(e){var e=i(e);b=f=e[0],v=p=e[1]}/*}}}*/
function t(e){var e=i(e);d=e[0]-b,l=e[1]-v,b=e[0],v=e[1]}/*}}}*/
function n(){return[d,l]}/*}}}*/
function r(e){var t=e[0],n=e[1];0>f+t&&(t-=t+f),0>p+n&&(n-=n+p),v+n>E&&(n+=E-(v+n)),b+t>A&&(t+=A-(b+t)),f+=t,b+=t,p+=n,v+=n}/*}}}*/
function s(e){var t=o();switch(e){case"ne":return[t.x2,t.y];case"nw":return[t.x,t.y];case"se":return[t.x2,t.y2];case"sw":return[t.x,t.y2]}}/*}}}*/
function o(){if(!B.aspectRatio)return c();
// This function could use some optimization I think...
var e,t,n=B.aspectRatio,r=B.minSize[0]/q,s=(B.minSize[1]/G,B.maxSize[0]/q),o=B.maxSize[1]/G,i=b-f,d=v-p,l=Math.abs(i),g=Math.abs(d),m=l/g;
// Magic %-)
// right side
// left side
return 0==s&&(s=10*A),0==o&&(o=10*E),n>m?(t=v,w=g*n,e=0>i?f-w:w+f,0>e?(e=0,h=Math.abs((e-f)/n),t=0>d?p-h:h+p):e>A&&(e=A,h=Math.abs((e-f)/n),t=0>d?p-h:h+p)):(e=b,h=l/n,t=0>d?p-h:p+h,0>t?(t=0,w=Math.abs((t-p)*n),e=0>i?f-w:w+f):t>E&&(t=E,w=Math.abs(t-p)*n,e=0>i?f-w:w+f)),e>f?(r>e-f?e=f+r:e-f>s&&(e=f+s),t=t>p?p+(e-f)/n:p-(e-f)/n):f>e&&(r>f-e?e=f-r:f-e>s&&(e=f-s),t=t>p?p+(f-e)/n:p-(f-e)/n),0>e?(f-=e,e=0):e>A&&(f-=e-A,e=A),0>t?(p-=t,t=0):t>E&&(p-=t-E,t=E),last=u(a(f,p,e,t))}/*}}}*/
function i(e){return e[0]<0&&(e[0]=0),e[1]<0&&(e[1]=0),e[0]>A&&(e[0]=A),e[1]>E&&(e[1]=E),[e[0],e[1]]}/*}}}*/
function a(e,t,n,r){var s=e,o=n,i=t,a=r;return e>n&&(s=n,o=e),t>r&&(i=r,a=t),[Math.round(s),Math.round(i),Math.round(o),Math.round(a)]}/*}}}*/
function c(){var e=b-f,t=v-p;if(V&&Math.abs(e)>V&&(b=e>0?f+V:f-V),Q&&Math.abs(t)>Q&&(v=t>0?p+Q:p-Q),Y&&Math.abs(t)<Y&&(v=t>0?p+Y:p-Y),X&&Math.abs(e)<X&&(b=e>0?f+X:f-X),0>f&&(b-=f,f-=f),0>p&&(v-=p,p-=p),0>b&&(f-=b,b-=b),0>v&&(p-=v,v-=v),b>A){var n=b-A;f-=n,b-=n}if(v>E){var n=v-E;p-=n,v-=n}if(f>A){var n=f-E;v-=n,p-=n}if(p>E){var n=p-E;v-=n,p-=n}return u(a(f,p,b,v))}/*}}}*/
function u(e){return{x:e[0],y:e[1],x2:e[2],y2:e[3],w:e[2]-e[0],h:e[3]-e[1]}}var d,l,f=0,p=0,b=0,v=0;/*}}}*/
return{flipCoords:a,setPressed:e,setCurrent:t,getOffset:n,moveOffset:r,getCorner:s,getFixed:o}}(),ie=function(){/*}}}*/
// Private Methods
function t(t){var n=e("<div />").css({position:"absolute",opacity:B.borderOpacity}).addClass(o(t));return _.append(n),n}/*}}}*/
function n(t,n){var r=e("<div />").mousedown(b(t)).css({cursor:t+"-resize",position:"absolute",zIndex:n});return ee.append(r),r}/*}}}*/
function a(e){return n(e,I++).css({top:r(-F+1),left:r(-F+1),opacity:B.handleOpacity}).addClass(o("handle"))}/*}}}*/
function c(e){var t=B.handleSize,o=F,i=t,a=t,c=o,u=o;switch(e){case"n":case"s":a=s(100);break;case"e":case"w":i=s(100)}return n(e,I++).width(a).height(i).css({top:r(-c+1),left:r(-u+1)})}/*}}}*/
function u(e){for(i in e)O[e[i]]=a(e[i])}/*}}}*/
function d(e){var t=Math.round(e.h/2-F),n=Math.round(e.w/2-F),s=(west=-F+1,e.w-F),o=e.h-F;"e"in O&&O.e.css({top:r(t),left:r(s)})&&O.w.css({top:r(t)})&&O.s.css({top:r(o),left:r(n)})&&O.n.css({left:r(n)}),"ne"in O&&O.ne.css({left:r(s)})&&O.se.css({top:r(o),left:r(s)})&&O.sw.css({top:r(o)}),"b"in O&&O.b.css({top:r(o)})&&O.r.css({left:r(s)})}/*}}}*/
function l(e,t){$.css({top:r(-t),left:r(-e)}),te.css({top:r(t),left:r(e)})}/*}}}*/
function f(e,t){te.width(e).height(t)}/*}}}*/
function h(){var e=oe.getFixed();oe.setPressed([e.x,e.y]),oe.setCurrent([e.x2,e.y2]),p()}/*}}}*/
// Internal Methods
function p(){return M?w():void 0}/*}}}*/
function w(){var e=oe.getFixed();f(e.w,e.h),l(e.x,e.y),B.drawBorders&&H.right.css({left:r(e.w-1)})&&H.bottom.css({top:r(e.h-1)}),D&&d(e),M||v(),B.onChange(g(e))}/*}}}*/
function v(){te.show(),W.css("opacity",B.bgOpacity),M=!0}/*}}}*/
function m(){S(),te.hide(),W.css("opacity",1),M=!1}/*}}}*/
function y(){D&&(d(oe.getFixed()),ee.show())}
//}}}
function x(){return D=!0,B.allowResize?(d(oe.getFixed()),ee.show(),!0):void 0}/*}}}*/
function S(){D=!1,ee.hide()}/*}}}*/
function k(e){(U=e)?S():x()}/*}}}*/
function z(){k(!1),h()}var M,I=370,H={},O={},D=!1,F=B.handleOffset;/* Insert draggable elements {{{*/
// Insert border divs for outline
B.drawBorders&&(H={top:t("hline").css("top",r(e.browser.msie?-1:0)),bottom:t("hline"),left:t("vline"),right:t("vline")}),
// Insert handles on edges
B.dragEdges&&(O.t=c("n"),O.b=c("s"),O.r=c("e"),O.l=c("w")),
// Insert side handles
B.sideHandles&&u(["n","s","e","w"]),
// Insert corner handles
B.cornerHandles&&u(["sw","nw","ne","se"]);/*}}}*/
var P=C().mousedown(b("move")).css({cursor:"move",position:"absolute",zIndex:360});return _.append(P),S(),{updateVisible:p,update:w,release:m,refresh:h,setCursor:function(e){P.css("cursor",e)},enableHandles:x,enableOnly:function(){D=!0},showHandles:y,disableHandles:S,animMode:k,done:z}}(),ae=function(){function t(){re.css({zIndex:450}),d&&e(document).mousemove(r).mouseup(s)}/*}}}*/
function n(){re.css({zIndex:290}),d&&e(document).unbind("mousemove",r).unbind("mouseup",s)}/*}}}*/
function r(e){a(c(e))}/*}}}*/
function s(e){return e.preventDefault(),e.stopPropagation(),L&&(L=!1,u(c(e)),B.onSelect(g(oe.getFixed())),n(),a=function(){},u=function(){}),!1}/*}}}*/
function o(e,n){return L=!0,a=e,u=n,t(),!1}/* }}} */
function i(e){re.css("cursor",e)}var a=function(){},u=function(){},d=B.trackDocument;return d||re.mousemove(r).mouseup(s).mouseout(s),W.before(re),{activateHandlers:o,setCursor:i}}(),ce=function(){function t(){B.keySupport&&(o.show(),o.focus())}/*}}}*/
function n(e){o.hide()}/*}}}*/
function r(e,t,n){B.allowMove&&(oe.moveOffset([t,n]),ie.updateVisible()),e.preventDefault(),e.stopPropagation()}/*}}}*/
function s(e){if(e.ctrlKey)return!0;Z=e.shiftKey?!0:!1;var t=Z?10:1;switch(e.keyCode){case 37:r(e,-t,0);break;case 39:r(e,t,0);break;case 38:r(e,0,-t);break;case 40:r(e,0,t);break;case 27:ie.release();break;case 9:return!0}return nothing(e)}var o=e('<input type="radio" />').css({position:"absolute",left:"-30px"}).keypress(s).blur(n),i=e("<div />").css({position:"absolute",overflow:"hidden"}).append(o);/*}}}*/
return B.keySupport&&i.insertBefore(W),{watchKeys:t}}();
//}}}
// }}}
ee.hide(),R(!0);var ue={animateTo:S,setSelect:k,setOptions:O,tellSelect:I,tellScaled:H,disable:D,enable:F,cancel:P,focus:ce.watchKeys,getBounds:function(){return[A*q,E*G]},getWidgetSize:function(){return[A,E]},release:ie.release,destroy:J};return K.data("Jcrop",ue),ue},e.fn.Jcrop=function(t){function n(n){var r=t.useImg||n.src,s=new Image;s.onload=function(){e.Jcrop(n,t)},s.src=r}
// Return "this" so we're chainable a la jQuery plugin-style!
/*}}}*/
// Iterate over each object, attach Jcrop
return"object"!=typeof t&&(t={}),this.each(function(){
// If we've already attached to this object
if(e(this).data("Jcrop")){
// The API can be requested this way (undocumented)
if("api"==t)return e(this).data("Jcrop");e(this).data("Jcrop").setOptions(t)}else n(this)}),this}}(jQuery);