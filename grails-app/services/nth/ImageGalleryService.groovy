package nth

/**
 * ImageGallery service is used to save/update Images and adding images to the gallery.
 */
class ImageGalleryService {

    static transactional = true

  /**
   * Saves the image
   * @param args includes caption, description and image bytes
   * @return Image
   */
    Foto saveImage(Map args) {
        Foto image = new Foto(args)
        image.save()
        return image
    }

 /**
   * Saves the image
   * @param data
   * @param caption
   * @return Image
   */
    Foto saveImage(byte[] data, String caption = "") {
        Foto image = new Foto(data: data, caption: caption)
        image.save()
        return image
    }

 /**
   * Saves the image
   * @param data
   * @param caption
   * @return Image
   */
    Foto saveImage(byte[] data, String description, String caption) {
        Foto image = new Foto(data: data, caption: caption, description: description)
        image.save()
        return image
    }

   /**
   * Updates the image
   * @param id
   * @param data
   * @param caption
   * @param description
   * @return Image
   */
    Foto updateImage(Long id, byte[] data, String caption = "", String description = "") {
        Foto image = Image.get(id)
        description = description ?: image?.description
        caption = caption ?: image?.caption
        updateImage(image, data, description, caption)
        return image
    }

   /**
   * Updates the image
   * @param image
   * @param data
   * @param caption
   * @param description
   * @return Image
   */
    Foto updateImage(Foto image, byte[] data, String description = "", String caption = "") {
        image.data = data
        image.caption = caption ?: image?.caption
        image.description = description ?: image?.description
        return image
    }




   

}
