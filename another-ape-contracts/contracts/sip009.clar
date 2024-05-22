
;; title: sip009
;; version:
;; summary:
;; description:

;; traits
;;

(define-trait nft-trait
  (
    ;; Last token ID, limited to uint range
    (get-last-token-id () (response uint uint))

    ;; URI for metadata associated with the token
    (get-token-uri (uint) (response (optional (string-ascii 256)) uint))

     ;; Owner of a given token identifier
    (get-owner (uint) (response (optional principal) uint))

    ;; Transfer from the sender to a new principal
    (transfer (uint principal principal) (response bool uint))
  )
)



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

(define-data-var base-uri (string-ascii 100) "bafybeigi4zxlzz6wmqrgazeccbenctvhdn5bw7o7qlwfvqo7g5alij4bda") ;; see 33:21 in video if this is incorrect


;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

