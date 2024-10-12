import Footer from '../../layout/customer/footer/footer'
import banner from '../../assest/banner.jpg'
import banner1 from '../../assest/banner1.png'
import banner2 from '../../assest/banner2.jpg'
import {getMethod} from '../../services/request'
import {formatMoney} from '../../services/money'
import { useState, useEffect } from 'react'
import { Parser } from "html-to-react";
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';


var sizepro = 20
function Home(){

    useEffect(()=>{
  }, []);
  



    return(
     <>
        <div class="bannerindex">
        <div id="courseindex">
            <div id="carouselExampleControls" class="carousel slide bannerindex" data-bs-ride="carousel">
                <div id="carouselindex">
                    <div class="carousel-inner carousel-inner-index">
                        <div class="carousel-item active">
                            <a href=""><img src={banner2} class="d-block w-100"/></a>
                        </div>
                        <div class="carousel-item">
                            <a href=""><img src={banner1} class="d-block w-100"/></a>
                        </div>
                        <div class="carousel-item">
                            <a href=""><img src={banner} class="d-block w-100"/></a>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
        </div>
    </div>
     </>
    );
}

export default Home;
