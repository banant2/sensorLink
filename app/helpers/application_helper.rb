module ApplicationHelper
  def buildMenu(array @menu_array, @is_sub=FALSE)
  {
     $ul_attrs = @is_sub ? 'class="dropdown-menu"' : 'class="nav navbar-nav"'
     $menu = "<ul $ul_attrs>";

     foreach(@menu_array as $id => $attrs)
     {
       $sub = isset($attrs['sub'])
         ? buildMenu($attrs['sub'], TRUE)
         : null;
         $li_attrs = $sub ? 'class="dropdown"' : null;
      $a_attrs  = $sub ? 'class="dropdown-toggle" data-toggle="dropdown"' : null;
      $carat    = $sub ? '<span class="caret"></span>' : null;
      $menu .= "<li $li_attrs>";
      $menu .= "<a href='$id' $a_attrs>${attrs['text']}$carat</a>$sub";
      $menu .= "</li>";
     }

   return $menu . "</ul>";
  }
end
