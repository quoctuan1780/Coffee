@extends('master')
@section('content')
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="beta-products-list">
                        <h4>Tìm kiếm</h4>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy {{count($product)}} sản phẩm</p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                        @foreach($product as $spmoi)
                            <div class="col-sm-3" style="height: 400px;">
                                <div class="single-item">
                                @if($spmoi->promotion_price != 0)
                                    <div class="ribbon-wrapper">
                                        <div class="ribbon sale">Sale</div>
                                    </div>
                                @endif

                                    <div class="single-item-header">
                                        <a href="{{route('chi-tiet-san-pham', $spmoi->id)}}"><img style="box-shadow: 0px 0px 3px 0px rgba(88, 88, 88, 0.3);" src="image/product/{{$spmoi->image}}" alt="" height="250px"></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title">{{$spmoi->name}}</p>
                                        <p class="single-item-price">
                                        @if($spmoi->promotion_price == 0)
                                            <span class="flash-sale">{{number_format($spmoi->unit_price)}} VND</span>
                                        @else
                                            <span class="flash-del">{{number_format($spmoi->unit_price)}} VND</span>
                                            <span class="flash-sale">{{number_format($spmoi->promotion_price)}} VND</span>
                                        @endif
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <a class="add-to-cart pull-left" href="{{ route('them-gio-hang', $spmoi->id) }}"><i class="fa fa-shopping-cart"></i></a>
                                        <a class="beta-btn primary" href="{{route('chi-tiet-san-pham', $spmoi->id)}}">Chi tiết<i class="fa fa-chevron-right"></i></a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div>
                    </div> <!-- .beta-products-list -->

                    <div class="space50">&nbsp;</div>
                </div>
            </div> <!-- end section with sidebar and main content -->


        </div> <!-- .main-content -->
    </div> <!-- #content -->
@endsection