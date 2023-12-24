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
-- Submodules: 40
entity deo_0CLK_ebde644c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_ebde644c;
architecture arch of deo_0CLK_ebde644c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l497_c6_ee55]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_d97a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l497_c2_0078]
signal result_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l497_c2_0078_return_output : opcode_result_t;

-- n8_MUX[uxn_opcodes_h_l497_c2_0078]
signal n8_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c2_0078]
signal t8_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l497_c2_0078]
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l510_c11_176f]
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_7c49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_d97a]
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l510_c7_d97a]
signal n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l510_c7_d97a]
signal t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l510_c7_d97a]
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l513_c11_341b]
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_3178]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : signed(3 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_7c49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l513_c7_7c49]
signal n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l513_c7_7c49]
signal t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l513_c7_7c49]
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l515_c30_b9b8]
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l519_c9_e9d2]
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l519_c9_191b]
signal MUX_uxn_opcodes_h_l519_c9_191b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_191b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_191b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l519_c9_191b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_fc02]
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l520_c23_52f6]
signal device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l520_c23_52f6_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4770( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.vram_write_layer := ref_toks_7;
      base.is_device_ram_write := ref_toks_8;
      base.device_ram_address := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55
BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_MUX_uxn_opcodes_h_l497_c2_0078
result_MUX_uxn_opcodes_h_l497_c2_0078 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l497_c2_0078_cond,
result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue,
result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse,
result_MUX_uxn_opcodes_h_l497_c2_0078_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c2_0078
n8_MUX_uxn_opcodes_h_l497_c2_0078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c2_0078_cond,
n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue,
n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse,
n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c2_0078
t8_MUX_uxn_opcodes_h_l497_c2_0078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c2_0078_cond,
t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue,
t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse,
t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c2_0078
device_out_result_MUX_uxn_opcodes_h_l497_c2_0078 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f
BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right,
BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a
result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a
result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- n8_MUX_uxn_opcodes_h_l510_c7_d97a
n8_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- t8_MUX_uxn_opcodes_h_l510_c7_d97a
t8_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a
device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond,
device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue,
device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse,
device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b
BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right,
BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49
result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49
result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- n8_MUX_uxn_opcodes_h_l513_c7_7c49
n8_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- t8_MUX_uxn_opcodes_h_l513_c7_7c49
t8_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49
device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond,
device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue,
device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse,
device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output);

-- sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8
sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins,
sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x,
sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y,
sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2
BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right,
BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output);

-- MUX_uxn_opcodes_h_l519_c9_191b
MUX_uxn_opcodes_h_l519_c9_191b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l519_c9_191b_cond,
MUX_uxn_opcodes_h_l519_c9_191b_iftrue,
MUX_uxn_opcodes_h_l519_c9_191b_iffalse,
MUX_uxn_opcodes_h_l519_c9_191b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right,
BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output);

-- device_out_uxn_opcodes_h_l520_c23_52f6
device_out_uxn_opcodes_h_l520_c23_52f6 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l520_c23_52f6_device_address,
device_out_uxn_opcodes_h_l520_c23_52f6_value,
device_out_uxn_opcodes_h_l520_c23_52f6_phase,
device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read,
device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read,
device_out_uxn_opcodes_h_l520_c23_52f6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_MUX_uxn_opcodes_h_l497_c2_0078_return_output,
 n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output,
 t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output,
 sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output,
 MUX_uxn_opcodes_h_l519_c9_191b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output,
 device_out_uxn_opcodes_h_l520_c23_52f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_0078_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l497_c2_0078_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_513f : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_fd12 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_f53d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_d97a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_357a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_191b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_191b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_191b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l519_c9_191b_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_ac2a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_f50b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_1e82_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_919e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_ea2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_76fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_82fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_4d8e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6c36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_db99_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f7ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_ccb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_54d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_c442_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_513f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_fd12 := resize(to_unsigned(1, 1), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right := to_unsigned(3, 2);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_f53d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l511_c3_f53d;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_357a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l518_c3_357a;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l519_c9_191b_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l519_c9_191b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_db99 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_db99_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_c442 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_c442_return_output := result.device_ram_address;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_0078_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l502_c3_513f,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l507_c3_fd12,
     to_unsigned(0, 1));

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_ccb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_ccb4_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_54d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_54d3_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6c36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6c36_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l513_c11_341b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_left;
     BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output := BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c6_ee55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l520_c42_fc02] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_left;
     BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output := BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f7ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f7ba_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l510_c11_176f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_left;
     BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output := BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_4d8e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_4d8e_return_output := result.u8_value;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_d97a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l519_c9_e9d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l515_c30_b9b8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_ins;
     sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_x;
     sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output := sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_d97a_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c6_ee55_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l510_c11_176f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l513_c11_341b_return_output;
     VAR_MUX_uxn_opcodes_h_l519_c9_191b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l519_c9_e9d2_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l520_c42_fc02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_db99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_db99_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_54d3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_54d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6c36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_6c36_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f7ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_f7ba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_ccb4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_ccb4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_c442_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_c442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_4d8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l513_l510_DUPLICATE_4d8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l497_c2_0078_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l510_c7_d97a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l510_c7_d97a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l515_c30_b9b8_return_output;
     -- t8_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- MUX[uxn_opcodes_h_l519_c9_191b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l519_c9_191b_cond <= VAR_MUX_uxn_opcodes_h_l519_c9_191b_cond;
     MUX_uxn_opcodes_h_l519_c9_191b_iftrue <= VAR_MUX_uxn_opcodes_h_l519_c9_191b_iftrue;
     MUX_uxn_opcodes_h_l519_c9_191b_iffalse <= VAR_MUX_uxn_opcodes_h_l519_c9_191b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l519_c9_191b_return_output := MUX_uxn_opcodes_h_l519_c9_191b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_value := VAR_MUX_uxn_opcodes_h_l519_c9_191b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_MUX_uxn_opcodes_h_l519_c9_191b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     -- t8_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- n8_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse := VAR_t8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;
     -- t8_MUX[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c2_0078_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_cond;
     t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output := t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output;

     -- n8_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l517_c1_3178] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l517_c1_3178_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse := VAR_n8_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l497_c2_0078_return_output;
     -- device_out[uxn_opcodes_h_l520_c23_52f6] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l520_c23_52f6_device_address <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_device_address;
     device_out_uxn_opcodes_h_l520_c23_52f6_value <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_value;
     device_out_uxn_opcodes_h_l520_c23_52f6_phase <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_phase;
     device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_device_ram_read;
     device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l520_c23_52f6_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output := device_out_uxn_opcodes_h_l520_c23_52f6_return_output;

     -- n8_MUX[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c2_0078_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_cond;
     n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output := n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l497_c2_0078_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l525_c26_ea2d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_ea2d_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l526_c29_76fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_76fb_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l527_c24_82fa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_82fa_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l521_c32_ac2a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_ac2a_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l523_c21_1e82] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_1e82_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l524_c22_919e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_919e_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l522_c31_f50b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_f50b_return_output := VAR_device_out_uxn_opcodes_h_l520_c23_52f6_return_output.device_ram_address;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l524_c22_919e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l527_c24_82fa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l521_c32_ac2a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l525_c26_ea2d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l526_c29_76fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l522_c31_f50b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l523_c21_1e82_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     -- result_vram_write_layer_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l513_c7_7c49] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l513_c7_7c49_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l510_c7_d97a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l497_c2_0078_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l510_c7_d97a_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l510_c7_d97a_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_fbe2_uxn_opcodes_h_l497_c2_0078_return_output;
     -- result_MUX[uxn_opcodes_h_l497_c2_0078] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l497_c2_0078_cond <= VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_cond;
     result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue <= VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iftrue;
     result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse <= VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output := result_MUX_uxn_opcodes_h_l497_c2_0078_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l497_c2_0078_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
