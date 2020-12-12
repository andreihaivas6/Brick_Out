class Brick{
  float x,y;
  boolean alive=true;
  Brick(float x_, float y_){
    //alive=true;
    x=x_;
    y=y_;
  }
  void display(){
    fill(255);
    rect(x,y,80,40);
  }
  void hit(){
    if(location.x+12.5>=x && location.x-12.5<=x+80 && location.y+12.5>=y && location.y-12.5<=y+40){
      alive=false;
      if(((location.x+11.5<=x && x<=location.x+13.5) || (location.x+11.5<=x+80 && x+80<=location.x+13.5))&&((location.y+11.5<=y && y<=location.y+13.5) || (location.y+11.5<=y+40 && y+40<=location.y+13.5))){
        speed.x=-speed.x;
        speed.y=-speed.y;
      }
      else
        if((location.x+11.5<=x && x<=location.x+13.5) || (location.x+11.5<=x+80 && x+80<=location.x+13.5))
          speed.x=-speed.x;
        else
          speed.y=-speed.y;
    }
  }
}
