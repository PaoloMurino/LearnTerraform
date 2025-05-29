variable "providerDefault" {
  description = "Le opzioni di defaut per progetto, region e zone"
  type = object({
    project = string
    region  = string
    zone    = string
  })
}

variable "buckets" {
  description = "I bucket dove verrano salvati il testo estratto dall'immagine e la traduzione"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "pubsub_topics" {
  description = "I Pub/Sub per la richiesta di traduzione e la pubblicazione della traduzione completata"
  type        = list(string)
  default     = ["ocr-translation-request", "ocr-translation-finished"]
}