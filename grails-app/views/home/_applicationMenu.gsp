<div>
    <ul>
        <g:if test="${currentMenuItem}">
            <li><a href="home/selectCurrentMenuItem?currentMenuItem=${currentMenuItem?.upMenuItem?.id}" style="color: yellow">返回上级</a></li>
        </g:if>
        <g:each in="${systemMenuList}" var="item" status="i">
            <li>
                <g:if test="${item.menuAction == '#'}">
                    <a href="home/selectCurrentMenuItem?currentMenuItem=${item.id}">${item.menuContext}</a>
                </g:if>
                <g:else>
                    <a href="${item.menuAction}">${item.menuContext}</a>
                </g:else>
            </li>
        </g:each>
    </ul>
</div>
