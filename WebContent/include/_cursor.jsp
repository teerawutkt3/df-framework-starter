<nested:define id="_condition" property="searchCondition" type="com.depthfirst.framework.search.SearchCondition"/>
<nested:define id="_result" property="searchResult" type="com.depthfirst.framework.search.SearchResult"/>
<nested:hidden property="searchCondition.position" /><%!
int _perpages[] = {10, 25, 50, 100};
%><%
int _pos = _condition.getPosition();
int _psize = _condition.getPageSize();
int _size = _result.getSize();
boolean _prev = _pos-_psize >= 0;
boolean _next = _pos+_psize < _size;
%><table align="center" border="0" width="95%"><tr class="trcursor">
  <td width="30%" class="noprint" nowrap="nowrap">&nbsp;<% if(_psize < Integer.MAX_VALUE) {
  %><select name="searchCondition.pageSize" onchange="doGoto(0)"><% for(int _p=0; _p<_perpages.length; _p++) {
  %><option value="<%= _perpages[_p] %>"<%= _psize==_perpages[_p]?" selected":"" %>> หน้าละ <%= _perpages[_p] %> รายการ</option><% } %></select><% } %>
  &nbsp;<% if(_prev || _next) { %>
    ˹�ҷ�� <select onchange="doGoto(this.selectedIndex*<%= _psize %>)">
      <% for(int _p=0, _np=_size/_psize+(_size%_psize>0?1:0); _p<_np; _p++) {
        int _val=_p*_psize;
      %><option value="<%= _val %>"<%= _pos==_val?" selected":"" %>><%= _p+1 %> จากทั้งหมด <%= _np %></option><% } %>
    </select>
  <% } %>&nbsp;</td>
  <td width="40%" nowrap="nowrap" align="center">
    <%= _pos+1 %> ถึง <%= (_pos+_psize)>_size?_size:(_pos+_psize) %> จากทั้งหมด <%= _size %>
  </td>
  <td width="30%" align="right" class="noprint" nowrap="nowrap">&nbsp;<% if(_prev || _next) { %>
    <% if(_prev) { %>
    <a href="javascript:doGoto(0)"><img border="0" src="<%= request.getContextPath() %>/images/cursor/i.p.firstpg.gif" /></a>
    <a href="javascript:doGoto(<%= _pos-_psize %>)"><img border="0" src="<%= request.getContextPath() %>/images/cursor/i.p.prevpg.gif" /></a>
    <% }else { %>
    <img src="<%= request.getContextPath() %>/images/cursor/i.p.firstpg.d.gif" />
    <img src="<%= request.getContextPath() %>/images/cursor/i.p.prevpg.d.gif" />
    <% } %>
    <% if(_next) { %>
    <a href="javascript:doGoto(<%= _pos+_psize %>)"><img border="0" src="<%= request.getContextPath() %>/images/cursor/i.p.nextpg.gif" /></a>
    <a href="javascript:doGoto(<%= _size%_psize>0?(_size-(_size%_psize)):(_size-_psize) %>)"><img border="0" src="<%= request.getContextPath() %>/images/cursor/i.p.lastpg.gif" /></a>
    <% }else { %>
    <img src="<%= request.getContextPath() %>/images/cursor/i.p.nextpg.d.gif" />
    <img src="<%= request.getContextPath() %>/images/cursor/i.p.lastpg.d.gif" />
    <% } %>
  <% } %>&nbsp;</td>
</tr></table>
