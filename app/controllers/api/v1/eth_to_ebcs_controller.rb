class Api::V1::EthToEbcsController < ApplicationController
  # GET /api/v1/eth_to_ebcs
  def index
    eth_to_ebcs = EthToEbc.order(created_at: :desc).page(params[:page]).per(params[:per_page])

    render json: {
      result: {
        count: eth_to_ebcs.total_count,
        eth_to_ebcs: ActiveModelSerializers::SerializableResource.new(eth_to_ebcs, each_serializer: ::EthToEbcSerializer)
      }
    }
  end
end
