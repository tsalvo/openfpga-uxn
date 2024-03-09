-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 22
entity device_in_0CLK_1cf980b6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 stack_ptr0 : in unsigned(7 downto 0);
 stack_ptr1 : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_1cf980b6;
architecture arch of device_in_0CLK_1cf980b6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l617_c11_ddc5]
signal BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l619_c6_98d0]
signal BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l619_c1_d032]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l622_c7_5aa5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l619_c2_79cc]
signal result_MUX_uxn_device_h_l619_c2_79cc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l619_c2_79cc_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l619_c2_79cc_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l619_c2_79cc_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l620_c12_a331]
signal system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_stack_ptr0 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_stack_ptr1 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l620_c12_a331_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l622_c11_2670]
signal BIN_OP_EQ_uxn_device_h_l622_c11_2670_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l622_c11_2670_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l622_c1_0ea7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l625_c7_2df2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l622_c7_5aa5]
signal result_MUX_uxn_device_h_l622_c7_5aa5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l622_c7_5aa5_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l622_c7_5aa5_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l622_c7_5aa5_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l623_c12_100e]
signal screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l623_c12_100e_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l623_c12_100e_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l623_c12_100e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l625_c11_811f]
signal BIN_OP_EQ_uxn_device_h_l625_c11_811f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l625_c11_811f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l625_c1_c292]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l628_c7_9948]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l625_c7_2df2]
signal result_MUX_uxn_device_h_l625_c7_2df2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l625_c7_2df2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l625_c7_2df2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l625_c7_2df2_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l626_c12_c4a4]
signal controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l626_c12_c4a4_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l626_c12_c4a4_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l626_c12_c4a4_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l628_c11_1bdf]
signal BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l628_c1_a1c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l631_c1_8799]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l628_c7_9948]
signal result_MUX_uxn_device_h_l628_c7_9948_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l628_c7_9948_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l628_c7_9948_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l628_c7_9948_return_output : device_in_result_t;

-- datetime_dei[uxn_device_h_l629_c12_5550]
signal datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l629_c12_5550_device_address : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l629_c12_5550_phase : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l629_c12_5550_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l632_c12_9503]
signal generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l632_c12_9503_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l632_c12_9503_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l632_c12_9503_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l617_c11_ddc5
BIN_OP_AND_uxn_device_h_l617_c11_ddc5 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left,
BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right,
BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output);

-- BIN_OP_EQ_uxn_device_h_l619_c6_98d0
BIN_OP_EQ_uxn_device_h_l619_c6_98d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left,
BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right,
BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output);

-- result_MUX_uxn_device_h_l619_c2_79cc
result_MUX_uxn_device_h_l619_c2_79cc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l619_c2_79cc_cond,
result_MUX_uxn_device_h_l619_c2_79cc_iftrue,
result_MUX_uxn_device_h_l619_c2_79cc_iffalse,
result_MUX_uxn_device_h_l619_c2_79cc_return_output);

-- system_dei_uxn_device_h_l620_c12_a331
system_dei_uxn_device_h_l620_c12_a331 : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE,
system_dei_uxn_device_h_l620_c12_a331_device_address,
system_dei_uxn_device_h_l620_c12_a331_phase,
system_dei_uxn_device_h_l620_c12_a331_stack_ptr0,
system_dei_uxn_device_h_l620_c12_a331_stack_ptr1,
system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read,
system_dei_uxn_device_h_l620_c12_a331_return_output);

-- BIN_OP_EQ_uxn_device_h_l622_c11_2670
BIN_OP_EQ_uxn_device_h_l622_c11_2670 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l622_c11_2670_left,
BIN_OP_EQ_uxn_device_h_l622_c11_2670_right,
BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output);

-- result_MUX_uxn_device_h_l622_c7_5aa5
result_MUX_uxn_device_h_l622_c7_5aa5 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l622_c7_5aa5_cond,
result_MUX_uxn_device_h_l622_c7_5aa5_iftrue,
result_MUX_uxn_device_h_l622_c7_5aa5_iffalse,
result_MUX_uxn_device_h_l622_c7_5aa5_return_output);

-- screen_dei_uxn_device_h_l623_c12_100e
screen_dei_uxn_device_h_l623_c12_100e : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE,
screen_dei_uxn_device_h_l623_c12_100e_device_address,
screen_dei_uxn_device_h_l623_c12_100e_phase,
screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read,
screen_dei_uxn_device_h_l623_c12_100e_return_output);

-- BIN_OP_EQ_uxn_device_h_l625_c11_811f
BIN_OP_EQ_uxn_device_h_l625_c11_811f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l625_c11_811f_left,
BIN_OP_EQ_uxn_device_h_l625_c11_811f_right,
BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output);

-- result_MUX_uxn_device_h_l625_c7_2df2
result_MUX_uxn_device_h_l625_c7_2df2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l625_c7_2df2_cond,
result_MUX_uxn_device_h_l625_c7_2df2_iftrue,
result_MUX_uxn_device_h_l625_c7_2df2_iffalse,
result_MUX_uxn_device_h_l625_c7_2df2_return_output);

-- controller_dei_uxn_device_h_l626_c12_c4a4
controller_dei_uxn_device_h_l626_c12_c4a4 : entity work.controller_dei_0CLK_b6e68f82 port map (
clk,
controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE,
controller_dei_uxn_device_h_l626_c12_c4a4_device_address,
controller_dei_uxn_device_h_l626_c12_c4a4_phase,
controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons,
controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read,
controller_dei_uxn_device_h_l626_c12_c4a4_return_output);

-- BIN_OP_EQ_uxn_device_h_l628_c11_1bdf
BIN_OP_EQ_uxn_device_h_l628_c11_1bdf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left,
BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right,
BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output);

-- result_MUX_uxn_device_h_l628_c7_9948
result_MUX_uxn_device_h_l628_c7_9948 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l628_c7_9948_cond,
result_MUX_uxn_device_h_l628_c7_9948_iftrue,
result_MUX_uxn_device_h_l628_c7_9948_iffalse,
result_MUX_uxn_device_h_l628_c7_9948_return_output);

-- datetime_dei_uxn_device_h_l629_c12_5550
datetime_dei_uxn_device_h_l629_c12_5550 : entity work.datetime_dei_0CLK_24541ec2 port map (
clk,
datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l629_c12_5550_device_address,
datetime_dei_uxn_device_h_l629_c12_5550_phase,
datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read,
datetime_dei_uxn_device_h_l629_c12_5550_return_output);

-- generic_dei_uxn_device_h_l632_c12_9503
generic_dei_uxn_device_h_l632_c12_9503 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE,
generic_dei_uxn_device_h_l632_c12_9503_device_address,
generic_dei_uxn_device_h_l632_c12_9503_phase,
generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read,
generic_dei_uxn_device_h_l632_c12_9503_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 stack_ptr0,
 stack_ptr1,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output,
 BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output,
 result_MUX_uxn_device_h_l619_c2_79cc_return_output,
 system_dei_uxn_device_h_l620_c12_a331_return_output,
 BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output,
 result_MUX_uxn_device_h_l622_c7_5aa5_return_output,
 screen_dei_uxn_device_h_l623_c12_100e_return_output,
 BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output,
 result_MUX_uxn_device_h_l625_c7_2df2_return_output,
 controller_dei_uxn_device_h_l626_c12_c4a4_return_output,
 BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output,
 result_MUX_uxn_device_h_l628_c7_9948_return_output,
 datetime_dei_uxn_device_h_l629_c12_5550_return_output,
 generic_dei_uxn_device_h_l632_c12_9503_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l619_c2_79cc_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l619_c2_79cc_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l622_c7_5aa5_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l619_c2_79cc_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l619_c2_79cc_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l620_c12_a331_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l625_c7_2df2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l622_c7_5aa5_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l623_c12_100e_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l623_c12_100e_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l623_c12_100e_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l625_c7_2df2_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l625_c7_2df2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l628_c7_9948_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l625_c7_2df2_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l626_c12_c4a4_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l628_c7_9948_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l628_c7_9948_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l628_c7_9948_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l629_c12_5550_device_address : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l629_c12_5550_phase : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l629_c12_5550_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l632_c12_9503_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l632_c12_9503_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l632_c12_9503_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right := to_unsigned(192, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_stack_ptr0 := stack_ptr0;
     VAR_stack_ptr1 := stack_ptr1;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_device_address := VAR_device_address;
     VAR_datetime_dei_uxn_device_h_l629_c12_5550_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l632_c12_9503_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l623_c12_100e_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l620_c12_a331_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_phase := VAR_phase;
     VAR_datetime_dei_uxn_device_h_l629_c12_5550_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l632_c12_9503_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l623_c12_100e_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l620_c12_a331_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr0 := VAR_stack_ptr0;
     VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr1 := VAR_stack_ptr1;
     -- BIN_OP_AND[uxn_device_h_l617_c11_ddc5] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left <= VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_left;
     BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right <= VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output := BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left := VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_left := VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_left := VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left := VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l617_c11_ddc5_return_output;
     -- BIN_OP_EQ[uxn_device_h_l619_c6_98d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_left;
     BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output := BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l628_c11_1bdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left <= VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_left;
     BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right <= VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output := BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l622_c11_2670] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l622_c11_2670_left <= VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_left;
     BIN_OP_EQ_uxn_device_h_l622_c11_2670_right <= VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output := BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output;

     -- BIN_OP_EQ[uxn_device_h_l625_c11_811f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l625_c11_811f_left <= VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_left;
     BIN_OP_EQ_uxn_device_h_l625_c11_811f_right <= VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output := BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond := VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output;
     VAR_result_MUX_uxn_device_h_l619_c2_79cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l619_c6_98d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond := VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output;
     VAR_result_MUX_uxn_device_h_l622_c7_5aa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l622_c11_2670_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond := VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond := VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output;
     VAR_result_MUX_uxn_device_h_l625_c7_2df2_cond := VAR_BIN_OP_EQ_uxn_device_h_l625_c11_811f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond := VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond := VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output;
     VAR_result_MUX_uxn_device_h_l628_c7_9948_cond := VAR_BIN_OP_EQ_uxn_device_h_l628_c11_1bdf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l619_c1_d032] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l622_c7_5aa5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c7_5aa5_return_output;
     VAR_system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l619_c1_d032_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l622_c1_0ea7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output;

     -- system_dei[uxn_device_h_l620_c12_a331] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l620_c12_a331_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l620_c12_a331_device_address <= VAR_system_dei_uxn_device_h_l620_c12_a331_device_address;
     system_dei_uxn_device_h_l620_c12_a331_phase <= VAR_system_dei_uxn_device_h_l620_c12_a331_phase;
     system_dei_uxn_device_h_l620_c12_a331_stack_ptr0 <= VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr0;
     system_dei_uxn_device_h_l620_c12_a331_stack_ptr1 <= VAR_system_dei_uxn_device_h_l620_c12_a331_stack_ptr1;
     system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l620_c12_a331_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l620_c12_a331_return_output := system_dei_uxn_device_h_l620_c12_a331_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l625_c7_2df2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c7_2df2_return_output;
     VAR_screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l622_c1_0ea7_return_output;
     VAR_result_MUX_uxn_device_h_l619_c2_79cc_iftrue := VAR_system_dei_uxn_device_h_l620_c12_a331_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l628_c7_9948] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output;

     -- screen_dei[uxn_device_h_l623_c12_100e] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l623_c12_100e_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l623_c12_100e_device_address <= VAR_screen_dei_uxn_device_h_l623_c12_100e_device_address;
     screen_dei_uxn_device_h_l623_c12_100e_phase <= VAR_screen_dei_uxn_device_h_l623_c12_100e_phase;
     screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l623_c12_100e_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l623_c12_100e_return_output := screen_dei_uxn_device_h_l623_c12_100e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l625_c1_c292] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c7_9948_return_output;
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l625_c1_c292_return_output;
     VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iftrue := VAR_screen_dei_uxn_device_h_l623_c12_100e_return_output;
     -- controller_dei[uxn_device_h_l626_c12_c4a4] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l626_c12_c4a4_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l626_c12_c4a4_device_address <= VAR_controller_dei_uxn_device_h_l626_c12_c4a4_device_address;
     controller_dei_uxn_device_h_l626_c12_c4a4_phase <= VAR_controller_dei_uxn_device_h_l626_c12_c4a4_phase;
     controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons <= VAR_controller_dei_uxn_device_h_l626_c12_c4a4_controller0_buttons;
     controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l626_c12_c4a4_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l626_c12_c4a4_return_output := controller_dei_uxn_device_h_l626_c12_c4a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l631_c1_8799] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l628_c1_a1c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l631_c1_8799_return_output;
     VAR_datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l628_c1_a1c9_return_output;
     VAR_result_MUX_uxn_device_h_l625_c7_2df2_iftrue := VAR_controller_dei_uxn_device_h_l626_c12_c4a4_return_output;
     -- generic_dei[uxn_device_h_l632_c12_9503] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l632_c12_9503_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l632_c12_9503_device_address <= VAR_generic_dei_uxn_device_h_l632_c12_9503_device_address;
     generic_dei_uxn_device_h_l632_c12_9503_phase <= VAR_generic_dei_uxn_device_h_l632_c12_9503_phase;
     generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l632_c12_9503_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l632_c12_9503_return_output := generic_dei_uxn_device_h_l632_c12_9503_return_output;

     -- datetime_dei[uxn_device_h_l629_c12_5550] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l629_c12_5550_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l629_c12_5550_device_address <= VAR_datetime_dei_uxn_device_h_l629_c12_5550_device_address;
     datetime_dei_uxn_device_h_l629_c12_5550_phase <= VAR_datetime_dei_uxn_device_h_l629_c12_5550_phase;
     datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read <= VAR_datetime_dei_uxn_device_h_l629_c12_5550_previous_device_ram_read;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l629_c12_5550_return_output := datetime_dei_uxn_device_h_l629_c12_5550_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l628_c7_9948_iftrue := VAR_datetime_dei_uxn_device_h_l629_c12_5550_return_output;
     VAR_result_MUX_uxn_device_h_l628_c7_9948_iffalse := VAR_generic_dei_uxn_device_h_l632_c12_9503_return_output;
     -- result_MUX[uxn_device_h_l628_c7_9948] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l628_c7_9948_cond <= VAR_result_MUX_uxn_device_h_l628_c7_9948_cond;
     result_MUX_uxn_device_h_l628_c7_9948_iftrue <= VAR_result_MUX_uxn_device_h_l628_c7_9948_iftrue;
     result_MUX_uxn_device_h_l628_c7_9948_iffalse <= VAR_result_MUX_uxn_device_h_l628_c7_9948_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l628_c7_9948_return_output := result_MUX_uxn_device_h_l628_c7_9948_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l625_c7_2df2_iffalse := VAR_result_MUX_uxn_device_h_l628_c7_9948_return_output;
     -- result_MUX[uxn_device_h_l625_c7_2df2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l625_c7_2df2_cond <= VAR_result_MUX_uxn_device_h_l625_c7_2df2_cond;
     result_MUX_uxn_device_h_l625_c7_2df2_iftrue <= VAR_result_MUX_uxn_device_h_l625_c7_2df2_iftrue;
     result_MUX_uxn_device_h_l625_c7_2df2_iffalse <= VAR_result_MUX_uxn_device_h_l625_c7_2df2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l625_c7_2df2_return_output := result_MUX_uxn_device_h_l625_c7_2df2_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iffalse := VAR_result_MUX_uxn_device_h_l625_c7_2df2_return_output;
     -- result_MUX[uxn_device_h_l622_c7_5aa5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l622_c7_5aa5_cond <= VAR_result_MUX_uxn_device_h_l622_c7_5aa5_cond;
     result_MUX_uxn_device_h_l622_c7_5aa5_iftrue <= VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iftrue;
     result_MUX_uxn_device_h_l622_c7_5aa5_iffalse <= VAR_result_MUX_uxn_device_h_l622_c7_5aa5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l622_c7_5aa5_return_output := result_MUX_uxn_device_h_l622_c7_5aa5_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l619_c2_79cc_iffalse := VAR_result_MUX_uxn_device_h_l622_c7_5aa5_return_output;
     -- result_MUX[uxn_device_h_l619_c2_79cc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l619_c2_79cc_cond <= VAR_result_MUX_uxn_device_h_l619_c2_79cc_cond;
     result_MUX_uxn_device_h_l619_c2_79cc_iftrue <= VAR_result_MUX_uxn_device_h_l619_c2_79cc_iftrue;
     result_MUX_uxn_device_h_l619_c2_79cc_iffalse <= VAR_result_MUX_uxn_device_h_l619_c2_79cc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l619_c2_79cc_return_output := result_MUX_uxn_device_h_l619_c2_79cc_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l619_c2_79cc_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l619_c2_79cc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
