
;; title: another-ape
;; version:
;; summary: sample nft contract
;; description:

;; traits
;;

(impl-trait .sip009.nft-trait)

;; token definitions
;;

(define-non-fungible-token another-ape uint)


;; constants
;;


(define-constant MINT_PRICE u5000000)

(define-constant CONTRACT_OWNER tx-sender)

(define-constant ERR_NOT_TOKEN_OWNER (err u101))


;; data vars
;;

(define-data-var last-token-id uint u0)

(define-data-var base-uri (string-ascii 100) "bafybeigi4zxlzz6wmqrgazeccbenctvhdn5bw7o7qlwfvqo7g5alij4bda") ;; see 33:21 in video if this is incorrect --- IT WORKS!


;; data maps
;;

;; public functions
;;

(define-public (transfer (id uint) (sender principal) (receiver principal)) 
    (begin 
        (asserts! (is-eq tx-sender sender) ERR_NOT_TOKEN_OWNER)
        (nft-transfer? another-ape id sender receiver)
    )
)

(define-public (mint) 
    (let 
        (
            (id (+ (var-get last-token-id) u1))
        )
        ;; pay mint fee / transfer stx
        (try! (stx-transfer? MINT_PRICE tx-sender CONTRACT_OWNER))
        ;; mint new nft
        (try! (nft-mint? another-ape id tx-sender))
        ;; set our new "last token id"
        (var-set last-token-id id)
        (ok id)
    )
)


;; read only functions
;;

(define-read-only (get-last-token-id) 
   (ok (var-get last-token-id)) 
)


(define-read-only (get-token-uri (id uint))
    (ok (some (var-get base-uri))) ;; see data var if this is not working / 33:21 in video --- IT WORKS!
)


(define-read-only (get-owner (id uint)) 
    (ok (nft-get-owner? another-ape id))
)

;; private functions
;;

