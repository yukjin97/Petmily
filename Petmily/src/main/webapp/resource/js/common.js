var ui = {
	init: function(){
		ui.selectLink();
		ui.gotoTop();
		ui.mobileMenu();
		ui.starScore();
		ui.listActive();
		ui.accordion();
		ui.toggleContent();
		ui.optionBar();
		ui.toggleLike();
		ui.loginTab();
		ui.inpFocus();
		ui.searchWrap();
		ui.lnbEvt();
		ui.categoryMenu();
		ui.calendar();
		ui.shareBtn();
		ui.sortBtn();
	},
	selectLink: function(){
		$('#footer .family-site .selected').on('click',function(){
			if($(this).parent().is('.open')){
				$(this).parent().removeClass('open');
			}else{
				$(this).parent().addClass('open');
			}
		});
	},
	gotoTop: function(){
		function windowCheck(){
			var windowWidth = $( window ).width();
			if(windowWidth < 1336) {
				$('.btn-top').addClass('right-fixed');
			}else{
				$('.btn-top').removeClass('right-fixed');
			}
		}

		$('.btn-top').on('click',function(){
			$('html, body').animate({scrollTop : 0}, 400);
			return false;
		});

		windowCheck();

		$( window ).resize(function(){
			windowCheck();
		});
	},
	mobileMenu: function(){
		$('#header .btn-menu').on('click', function(e){
			e.preventDefault();

			if($('#sideMenu').is('.menu-open')){
				$('html').css('overflow-y','auto');
				$('#sideMenu').removeClass('menu-open');
			}else{
				$('html').css('overflow-y','hidden');
				$('#sideMenu').addClass('menu-open');
			}
		});

		$('#sideMenu .btn-menu-close, #sideMenu .dim').on('click', function(){
			$('html').css('overflow-y','auto');
			$('#sideMenu').removeClass('menu-open');
		});

		$('#sideMenu .has-sub>a').on('click',function(e){
			e.preventDefault();
			var menu = $(this).parent('li');
			if( menu.is('.menu-open') ){
				menu.find('.submenu').stop().slideUp(300);
				menu.removeClass('menu-open');
			}else{
				menu.find('.submenu').stop().slideDown(300);
				menu.addClass('menu-open');
			}
		});
	},
	starScore: function(){
		$('.star-score.review .star').on('click', function(){
			var idx = $(this).index();
			$(this).parents('.star-score').find('.star').removeClass('on');

			for(i=0; i<=idx; i++){
				$(this).parents('.star-score').find('.star').eq(i).addClass('on');
			}
		});
	},
	listActive: function(){
		$('.pdt-bd-list').not('.list-st-accordion').children('li').on('click',function(e){
			e.preventDefault();
			$(this).siblings('li').removeClass('active');
			if ($(this).is('.active')) {
				$(this).removeClass('active');
			} else {
				$(this).addClass('active');
			}
		});
	},
	accordion: function(){
		$('.list-st-accordion .bd-tit').on('click',function(e){
			e.preventDefault();
			if ($(this).is('.active')) {
				$('.list-st-accordion .bd-tit').removeClass('active');
				$('.list-st-accordion .bd-cont').stop().slideUp(200).removeClass('open');
			} else {
				$('.list-st-accordion .bd-tit').removeClass('active');
				$('.list-st-accordion .bd-cont').stop().slideUp(200).removeClass('open');
				$(this).addClass('active');
				$(this).next('.bd-cont').stop().slideDown(200).addClass('open');
			}
		});
	},
	toggleContent: function(){
		$('.toggle-title').on('click',function(e){
			e.preventDefault();
			if( $(this).next('.toggle-content').is('.open') ){
				$(this).removeClass('active');
				$(this).next('.toggle-content').stop().slideUp(200).removeClass('open');
			} else {
				$(this).addClass('active');
				$(this).next('.toggle-content').stop().slideDown(200).addClass('open');
			}
		});
	},
	optionBar: function(){
		$('.toggle-pop-wrap .btn-lay-open').on('click', function(e){
			e.preventDefault();
			var togglePop = $(this).parents('.toggle-pop-wrap').find('.lay-pop');

			if(togglePop.is('.show')){
				togglePop.removeClass('show');
			}else{
				togglePop.addClass('show');
			}
		});

		$('.toggle-pop-wrap .btn-close').on('click', function(){
			var togglePop = $(this).parents('.lay-pop');

			togglePop.removeClass('show');
		});
	},
	toggleLike: function(){
		$('.btn-like, .product-list .icon.like').on('click', function(e){
			e.preventDefault();

			if($(this).is('.active')){
				$(this).removeClass('active');
			}else{
				$(this).addClass('active');
			}
		});
	},
	loginTab: function(){
		var target = $('.tab-list input'),
			tabCont = $(".tab-cont-wrap .tab-cont");

		target.on('click', function(){
			var $this = $(this);
			var $index = $this.closest('li').index();

			tabCont.hide();
			tabCont.eq($index).show();
		});
	},
	inpFocus: function(){
		var loginInp = $('.pop-wrap.login').find('.inp-box input');

		loginInp.on('focusin', function(){
			$(this).css({borderBottom: '2px solid #000'});
		});

		loginInp.on('focusout', function(){
			$(this).css({borderBottom: '2px solid #ddd'});
			if( $(this).val() ){
				$(this).css({borderBottom: '2px solid #000'});
			}
		});
	},
	searchWrap: function(){
		var schWrap = $('.search-wrap'),
			schContWrap = $('.search-cont-wrap'),
			schBtn = $('.btn-search'),
			schInp = $('#searchInput'),
			closeBtn = schContWrap.find('.btn-close');

		schBtn.on('click', function(){
			schContWrap.show();
		});

		schInp.on('focusin', function(){
			schContWrap.show();
			schContWrap.addClass('active');
			$('#wrap').on('scroll touchmove mousewheel', function (e) {
				e.preventDefault();
				e.stopPropagation();
				return false;
			});
		});

		closeBtn.on('click', function(){
			$(this).closest('.search-cont-wrap').hide();
			schContWrap.removeClass('active');
			$('#wrap').off('scroll touchmove mousewheel');
		});
	},
	lnbEvt: function(){
		var moLnb = $('.lnb-wrap.m-ver'),
			depBtn2 = moLnb.find('.dep2 > li.active > a');

		depBtn2.on('click', function(e){
			if( $(e.target).has('scroll') ){
				e.preventDefault();
				$(e.target).siblings('.scroll').show();
			}
		});

		$('body').on('click', function(e){
			if( !moLnb.find('.dep2 li.active').has(e.target).length ) moLnb.find('.dep2 .scroll').hide();
		});
	},
	categoryMenu: function(){
		var cateDep1 = $('.category-list-wrap .dep1'),
			trriger = $('.dep1>li>a');

		trriger.on('click', function(e){
			cateDep1.children('li').removeClass('active');
			$(e.target).parents('li').addClass('active');
		});

		$('body').on('click', function(e){
			if( !cateDep1.find('li.active').has(e.target).length ) cateDep1.find('li').removeClass('active');
		});
	},
	calendar: function(){
		$('.filter-wrap').length && $(".inp-txt.calendar").datepicker({
			showOn: "both",
			buttonImage: "../images/common/btn_calendar.png",
			buttonImageOnly: true,
			buttonText: "Select date"
		});
	},
	shareBtn: function(){
		var shareBtn = $('.pdt-title-wrap .share-wrap .btn-sns'),
			shareList = $('.share-list'),
			shareCloseBtn = shareList.find('.btn.close');

		shareBtn.on('click', function(){
			shareList.addClass('active');
		});
		shareCloseBtn.on('click', function(){
			shareList.removeClass('active');
		});
	},
	sortBtn: function(e){
		var sortList = $('.sort-wrap').find('li'),
			sortBtn = $('.sort-wrap').find('a');

		sortBtn.on('click', function(e){
			sortList.removeClass('active');
			$(e.target).parent('li').addClass('active');
		});
	}
}

var layerPop = {
	init: function(){
		layerPop.show();
		layerPop.hide();
	},
	show: function(target){
		var $pop = $('#' + target);
		$pop.show();
	},
	hide: function(target){
		if(typeof target == 'object'){
			$(target).parents('.layer-pop, .pop-wrap').hide();
			$('#laybox-mask').hide();
		}else{
			var $pop = $('#' + target);
			$pop.hide();
		}
	}
}

$(document).ready(function(){
	ui.init();
	layerPop.init();
});