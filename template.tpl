<!DOCTYPE html>
<html lang="fr">
<head>
    <title><?php echo decode(TITLE); ?></title>
    <!-- Bootstrap -->
    <link href="<?php echo www_css(); ?>bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo www_css(); ?>style.css" rel="stylesheet">

    <script src="<?php echo www_js(); ?>/jquery.1.8.3.min.js"></script>
    <script src="<?php echo www_js(); ?>/jquery.history.js"></script>
    <script src="<?php echo www_js(); ?>/bootstrap.min.js"></script>
    <script src="<?php echo www_js(); ?>/app.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>


<div class="container" id="wrapper">
    <div class="row">
        <?php echo ModuleManager::runHook('header'); ?>
        <!-- fin header -->

        <div class="span8" id="content">
            <?php echo zk_content(); ?>
        </div>
        <!-- fin conteneur central -->


        <div class="span2 sidebar" id="sidebar-left">
            <?php echo ModuleManager::runHook('sidebar_left'); ?>
        </div>
        <!-- fin barre latérale gauche -->
        <div class="span2 sidebar" id="sidebar-right">
            <?php echo ModuleManager::runHook('sidebar_right'); ?>
        </div>
        <!-- fin barre latérale droite -->


        <div class="span12" id="footer">
            <?php echo ModuleManager::runHook('footer'); ?>
        </div>
    </div>
</div>

<!-- Modal content -->
<div id="ajax-content" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
</div>

</body>
</html>