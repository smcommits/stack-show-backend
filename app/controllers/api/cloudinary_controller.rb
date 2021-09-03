module Api
  class CloudinaryController < ApplicationController
    def create
      @sig = Cloudinary::Utils.api_sign_request({
                                                  timestamp: sign_params[:timestamp],
                                                  upload_preset: sign_params[:upload_preset]
                                                },
                                                'nRGgSrJbjbN1prMa_aD11NPfk58')
      render json: {
        sig: @sig
      }
    end

    private

    def sign_params
      params.permit(:timestamp, :upload_preset)
    end
  end
end
