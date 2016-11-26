import React from "react";
import { shallow } from "enzyme";
import { expect } from "chai";
import jsdom from "jsdom";

import { Map } from "../app/components/Map";

describe("<Map/>", function () {

  before(function () {
    global.document = jsdom.jsdom("<!doctype html><html><body></body></html>");
    global.window = document.defaultView;
    global.navigator = { userAgent: "node.js" };
  });

  it("has props for markers", function () {
    const wrapper = shallow(<Map/>);
    expect(wrapper.props().markers).to.be.defined;
  });
});
