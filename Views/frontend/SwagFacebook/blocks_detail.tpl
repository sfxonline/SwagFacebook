{block name='frontend_index_header_meta_tags'}
    {$smarty.block.parent}
    {* Article name *}
    <meta property="og:title" content="{$sArticle.articleName|escape} | {$sShopname}" />

    {* Article is a product *}
    <meta property="og:type" content="product" />

    {* Product URL, same as the canonical URL *}
    <meta property="og:url" content="{url sArticle=$sArticle.articleID title=$sArticle.articleName}" />

    {* Description *}
    <meta property="og:description" content="{$sArticle.description_long|strip_tags|truncate:200}" />

    {* Set Application ID if set *}
    {if $app_id}
        <meta property="fb:app_id" content="{$app_id}"/>
    {/if}

    {* Add main image *}
    {if $sArticle.image.src.3}
        <meta property="og:image" content="{$sArticle.image.src.3}" />
    {else}
        <meta property="og:image" content="{link file='frontend/_resources/images/no_picture.jpg'}" />
    {/if}
{/block}

{block name="frontend_detail_index_actions"}
    {$smarty.block.parent}
    {if !$hideFacebook}
        <div id="SwagFacebookMarginTopContainer">
            <script src="//connect.facebook.net/{$Locale}/all.js#xfbml=1"></script>
            <fb:like href="{url sArticle=$sArticle.articleID}" send="send" layout="button_count" width="250" show_faces="false"></fb:like>
        </div>
    {/if}
{/block}

{block name="frontend_detail_index_tabs_related"}
    {$smarty.block.parent}
    {if $app_id && !$hideFacebook}
        <div id="facebook">
            <h2>{s namespace="frontend/SwagFacebook/blocks_detail" name="facebookTabTitle"}{/s}</h2>
            <div class="container">
                <div id="fb-root"></div><script src="//connect.facebook.net/{$Locale}/all.js#appId={$app_id}&amp;xfbml=1"></script>
                <fb:comments href="{url sArticle=$sArticle.articleID title=$sArticle.articleName}" migrated="1" xid="{$unique_id}" width="560"></fb:comments>
            </div>
        </div>
    {/if}
{/block}

{block name="frontend_detail_tabs_rating"}
    {$smarty.block.parent}
    {if $app_id && !$hideFacebook}
        <li>
            <a href="#facebook">{s namespace="frontend/SwagFacebook/blocks_detail" name="facebookTabTitle"}{/s}</a>
        </li>
    {/if}
{/block}