// Performance optimizations
(function() {
    'use strict';
    
    // Detect WebP support
    function supportsWebP() {
        return new Promise((resolve) => {
            const webP = new Image();
            webP.onload = webP.onerror = function() {
                resolve(webP.height === 2);
            };
            webP.src = 'data:image/webp;base64,UklGRjoAAABXRUJQVlA4IC4AAACyAgCdASoCAAIALmk0mk0iIiIiIgBoSygABc6WWgAA/veff/0PP8bA//LwYAAA';
        });
    }
    
    // Add WebP support class
    supportsWebP().then(function(supported) {
        document.documentElement.classList.add(supported ? 'webp' : 'no-webp');
    });
    
    // Optimize image loading
    function optimizeImages() {
        const lazyImages = document.querySelectorAll('img[loading="lazy"]');
        
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver(function(entries) {
                entries.forEach(function(entry) {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.addEventListener('load', function() {
                            img.classList.add('loaded');
                        });
                        imageObserver.unobserve(img);
                    }
                });
            });
            
            lazyImages.forEach(function(img) {
                imageObserver.observe(img);
            });
        } else {
            // Fallback for browsers without IntersectionObserver
            lazyImages.forEach(function(img) {
                img.addEventListener('load', function() {
                    img.classList.add('loaded');
                });
            });
        }
    }
    
    // Preload critical resources
    function preloadCriticalResources() {
        const criticalImages = [
            'assets/images/hero-bg-1.webp',
            'assets/images/logo.webp'
        ];
        
        criticalImages.forEach(function(src) {
            const link = document.createElement('link');
            link.rel = 'preload';
            link.as = 'image';
            link.href = src;
            link.type = 'image/webp';
            document.head.appendChild(link);
        });
    }
    
    // Initialize optimizations
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            optimizeImages();
            preloadCriticalResources();
        });
    } else {
        optimizeImages();
        preloadCriticalResources();
    }
    
})();