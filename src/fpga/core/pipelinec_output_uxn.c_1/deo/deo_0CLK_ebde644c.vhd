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
-- BIN_OP_EQ[uxn_opcodes_h_l514_c6_7b76]
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_312e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l514_c2_9d19]
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l514_c2_9d19]
signal n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l514_c2_9d19]
signal result_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : opcode_result_t;
signal result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : opcode_result_t;

-- t8_MUX[uxn_opcodes_h_l514_c2_9d19]
signal t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l527_c11_39f4]
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_f06f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l527_c7_312e]
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l527_c7_312e]
signal n8_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_312e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l527_c7_312e]
signal t8_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l530_c11_dc6d]
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_ff37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l530_c7_f06f]
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l530_c7_f06f]
signal n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : signed(3 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_f06f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l530_c7_f06f]
signal t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l532_c30_aec1]
signal sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l536_c9_7557]
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l536_c9_6237]
signal MUX_uxn_opcodes_h_l536_c9_6237_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_6237_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_6237_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l536_c9_6237_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_0e08]
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l537_c23_de55]
signal device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l537_c23_de55_return_output : device_out_result_t;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a258( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_write_layer := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.is_device_ram_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76
BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right,
BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19
device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond,
device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue,
device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse,
device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output);

-- n8_MUX_uxn_opcodes_h_l514_c2_9d19
n8_MUX_uxn_opcodes_h_l514_c2_9d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond,
n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue,
n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse,
n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output);

-- result_MUX_uxn_opcodes_h_l514_c2_9d19
result_MUX_uxn_opcodes_h_l514_c2_9d19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l514_c2_9d19_cond,
result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue,
result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse,
result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output);

-- t8_MUX_uxn_opcodes_h_l514_c2_9d19
t8_MUX_uxn_opcodes_h_l514_c2_9d19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond,
t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue,
t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse,
t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4
BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right,
BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l527_c7_312e
device_out_result_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond,
device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- n8_MUX_uxn_opcodes_h_l527_c7_312e
n8_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l527_c7_312e_cond,
n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e
result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e
result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- t8_MUX_uxn_opcodes_h_l527_c7_312e
t8_MUX_uxn_opcodes_h_l527_c7_312e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l527_c7_312e_cond,
t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue,
t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse,
t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right,
BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f
device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- n8_MUX_uxn_opcodes_h_l530_c7_f06f
n8_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- t8_MUX_uxn_opcodes_h_l530_c7_f06f
t8_MUX_uxn_opcodes_h_l530_c7_f06f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond,
t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue,
t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse,
t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l532_c30_aec1
sp_relative_shift_uxn_opcodes_h_l532_c30_aec1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins,
sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x,
sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y,
sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557
BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right,
BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output);

-- MUX_uxn_opcodes_h_l536_c9_6237
MUX_uxn_opcodes_h_l536_c9_6237 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l536_c9_6237_cond,
MUX_uxn_opcodes_h_l536_c9_6237_iftrue,
MUX_uxn_opcodes_h_l536_c9_6237_iffalse,
MUX_uxn_opcodes_h_l536_c9_6237_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right,
BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output);

-- device_out_uxn_opcodes_h_l537_c23_de55
device_out_uxn_opcodes_h_l537_c23_de55 : entity work.device_out_0CLK_1666823b port map (
clk,
device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l537_c23_de55_device_address,
device_out_uxn_opcodes_h_l537_c23_de55_value,
device_out_uxn_opcodes_h_l537_c23_de55_phase,
device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read,
device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read,
device_out_uxn_opcodes_h_l537_c23_de55_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output,
 n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output,
 result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output,
 t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output,
 device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output,
 sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output,
 MUX_uxn_opcodes_h_l536_c9_6237_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output,
 device_out_uxn_opcodes_h_l537_c23_de55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : opcode_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_9d19_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : opcode_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l514_c2_9d19_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : opcode_result_t;
 variable VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_e453 : signed(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0e42 : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_312e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_fd9f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_4992 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_6237_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_6237_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_6237_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l536_c9_6237_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_d35a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_7182_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_a7c3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_efc8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2180_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_3598_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_1073_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e8ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_80c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_275b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f9a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0124_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f95a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_26ac_return_output : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_e453 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_4992 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_result_sp_relative_shift_uxn_opcodes_h_l535_c3_4992;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_fd9f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l528_c3_fd9f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0e42 := resize(to_unsigned(1, 1), 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l536_c9_6237_iffalse := n8;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read := VAR_previous_ram_read;
     VAR_MUX_uxn_opcodes_h_l536_c9_6237_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_80c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_80c8_return_output := result.is_opc_done;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_9d19_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4770(
     result,
     to_unsigned(0, 1),
     VAR_result_sp_relative_shift_uxn_opcodes_h_l519_c3_e453,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l524_c3_0e42,
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_opcodes_h_l527_c11_39f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l514_c6_7b76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_left;
     BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output := BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_312e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l536_c9_7557] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_left;
     BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output := BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f95a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f95a_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_26ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_26ac_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l532_c30_aec1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_ins;
     sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_x;
     sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output := sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_275b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_275b_return_output := result.device_ram_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l537_c42_0e08] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_left;
     BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output := BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f9a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f9a7_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l530_c11_dc6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e8ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e8ba_return_output := result.vram_write_layer;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0124 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0124_return_output := result.u16_value;

     -- result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_312e_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l514_c6_7b76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l527_c11_39f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l530_c11_dc6d_return_output;
     VAR_MUX_uxn_opcodes_h_l536_c9_6237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l536_c9_7557_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l537_c42_0e08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0124_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_0124_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f9a7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f9a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_80c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_80c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_26ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_26ac_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e8ba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_e8ba_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_275b_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_275b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f95a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l527_l530_DUPLICATE_f95a_return_output;
     VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_4770_uxn_opcodes_h_l514_c2_9d19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue := VAR_result_sp_relative_shift_TRUE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l527_c7_312e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l527_c7_312e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l532_c30_aec1_return_output;
     -- t8_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- MUX[uxn_opcodes_h_l536_c9_6237] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l536_c9_6237_cond <= VAR_MUX_uxn_opcodes_h_l536_c9_6237_cond;
     MUX_uxn_opcodes_h_l536_c9_6237_iftrue <= VAR_MUX_uxn_opcodes_h_l536_c9_6237_iftrue;
     MUX_uxn_opcodes_h_l536_c9_6237_iffalse <= VAR_MUX_uxn_opcodes_h_l536_c9_6237_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l536_c9_6237_return_output := MUX_uxn_opcodes_h_l536_c9_6237_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l527_c7_312e_return_output;
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_value := VAR_MUX_uxn_opcodes_h_l536_c9_6237_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_MUX_uxn_opcodes_h_l536_c9_6237_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- t8_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output := t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- n8_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse := VAR_t8_MUX_uxn_opcodes_h_l527_c7_312e_return_output;
     -- t8_MUX[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_cond;
     t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue;
     t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output := t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;

     -- n8_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output := n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l534_c1_ff37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output;

     -- Submodule level 4
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l534_c1_ff37_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse := VAR_n8_MUX_uxn_opcodes_h_l527_c7_312e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;
     -- n8_MUX[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_cond;
     n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue;
     n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output := n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;

     -- device_out[uxn_opcodes_h_l537_c23_de55] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l537_c23_de55_device_address <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_device_address;
     device_out_uxn_opcodes_h_l537_c23_de55_value <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_value;
     device_out_uxn_opcodes_h_l537_c23_de55_phase <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_phase;
     device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_device_ram_read;
     device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l537_c23_de55_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output := device_out_uxn_opcodes_h_l537_c23_de55_return_output;

     -- Submodule level 5
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;
     -- CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_opcodes_h_l541_c22_efc8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_efc8_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l539_c31_7182] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_7182_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.device_ram_address;

     -- device_out_result_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l542_c26_2180] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2180_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l538_c32_d35a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_d35a_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l544_c24_1073] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_1073_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.is_deo_done;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l540_c21_a7c3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_a7c3_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l543_c29_3598] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_3598_return_output := VAR_device_out_uxn_opcodes_h_l537_c23_de55_return_output.vram_write_layer;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_opcodes_h_l541_c22_efc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l544_c24_1073_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l538_c32_d35a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l542_c26_2180_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l543_c29_3598_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l539_c31_7182_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l540_c21_a7c3_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output := device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l530_c7_f06f] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l527_c7_312e_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l530_c7_f06f_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output := device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l527_c7_312e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output;

     -- Submodule level 8
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l514_c2_9d19_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a258(
     result,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l527_c7_312e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l527_c7_312e_return_output);

     -- Submodule level 9
     VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_a258_uxn_opcodes_h_l514_c2_9d19_return_output;
     -- result_MUX[uxn_opcodes_h_l514_c2_9d19] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l514_c2_9d19_cond <= VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_cond;
     result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue <= VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iftrue;
     result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse <= VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output := result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l514_c2_9d19_return_output;
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
