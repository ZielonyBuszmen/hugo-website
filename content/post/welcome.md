+++
date = "2017-02-21T20:15:59+01:00"
title = "welcome"
draft = true
tags = [ "Development", "Go", "fast", "Blogging" ]
categories = [ "Development" ]
+++

#Post z możliwościami MD


*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_

  
  ## Przykładowy kod
  ```php
<?php
namespace App\Repositories\Customers;

use App\Events\SessionCartChanged;
use App\Models\CatalogProducts;
use App\Models\CustomersCarts;
use App\Models\CustomersCartsSession;
use App\Repositories\Repository;
use Illuminate\Container\Container as App;
use Illuminate\Http\Request;

class CartsRepository extends Repository
{
    protected $model = 'App\Models\CustomersCarts';

    protected $requrest;

    public function __construct(App $app, Request $request)
    {
        parent::__construct($app);
        $this->requrest = $request;

    }

    /** Dodaje przedmiot do koszyka */
    public function add($product_id)
    {
        $product = CatalogProducts::find($product_id);
        if ($product == null) throw new \ErrorException('Produkt o takim ID nie istenieje');

        $old_cart = $this->requrest->session()->has('cart') ? $this->requrest->session()->get('cart') : null;
        $cart = new CustomersCartsSession($old_cart);
        $cart->add($product, $product->product_id);

        $this->requrest->session()->put('cart', $cart);
    }
}
```

### Inne rzeczy

1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b
   
   
   - [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
   - [x] list syntax required (any unordered or ordered list supported)
   - [x] this is a complete item
   - [ ] this is an incomplete item
   
   
   
   
   First Header | Second Header
   ------------ | -------------
   Content from cell 1 | Content from cell 2
   Content in the first column | Content in the second column
  
  
  
![Example image](/static/img/coding.jpg)

  # Tytuł ble!!!